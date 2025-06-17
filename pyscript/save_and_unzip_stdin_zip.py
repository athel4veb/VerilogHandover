import os
import sys
import json
import zipfile

def is_single_top_folder(zip_obj):
    """Returns the folder name if all files are inside one top-level folder"""
    top_dirs = set()
    for name in zip_obj.namelist():
        if name.endswith('/'):
            continue
        parts = name.split('/')
        if len(parts) > 1:
            top_dirs.add(parts[0])
        else:
            return None  # File at root level
    return list(top_dirs)[0] if len(top_dirs) == 1 else None

def check_conflicts(zip_ref, target_folder, flatten_folder=None):
    conflicts = []
    for member in zip_ref.namelist():
        if member.endswith('/'):
            continue  # skip directories

        member_rel = os.path.relpath(member, flatten_folder) if flatten_folder else member
        target_path = os.path.join(target_folder, member_rel)
        parent_dir = os.path.dirname(target_path)

        # ✅ Case 1: parent path must be a directory or not exist
        if not os.path.isdir(parent_dir):
            if os.path.exists(parent_dir):
                conflicts.append(f"Expected a folder, but found a file: {parent_dir}")

        # ✅ Case 2 (Corrected): only flag if a folder is blocking a file — not if it's just a folder for children
        if os.path.isdir(target_path):
            # Only conflict if ZIP says it's a file, but folder exists in target
            if member.endswith('/') is False and not member.endswith('/index.html'):  # skip HTML index edge case
                info = zip_ref.getinfo(member)
                if not info.is_dir():  # it’s trying to write a file
                    conflicts.append(f"Expected a file, but found a folder: {target_path}")

    return conflicts

def main():
    if len(sys.argv) != 3:
        print(json.dumps({"status": False, "error": "Usage: python script.py <zip_file_path> <target_folder>"}))
        sys.exit(1)

    zip_file_path = sys.argv[1]
    target_folder = sys.argv[2]

    try:
        if not os.path.isfile(zip_file_path):
            raise FileNotFoundError(f"Zip file not found: {zip_file_path}")

        os.makedirs(target_folder, exist_ok=True)

        with zipfile.ZipFile(zip_file_path, 'r') as zip_ref:
            top_folder = is_single_top_folder(zip_ref)

            # ✅ Conflict check before extracting
            conflicts = check_conflicts(zip_ref, target_folder, flatten_folder=top_folder if top_folder else None)
            if conflicts:
                raise Exception("Conflicts detected:\n" + "\n".join(conflicts))

            if top_folder:
                members = [
                    f for f in zip_ref.namelist()
                    if f.startswith(top_folder + '/') and not f.endswith(top_folder + '/')
                ]
                for member in members:
                    target_path = os.path.join(target_folder, os.path.relpath(member, top_folder))
                    os.makedirs(os.path.dirname(target_path), exist_ok=True)
                    with open(target_path, 'wb') as out_file:
                        out_file.write(zip_ref.read(member))
                result = {
                    "status": True,
                    "flattened": True,
                    "flattened_folder": top_folder,
                    "extracted_files": [os.path.relpath(f, top_folder) for f in members],
                }
            else:
                zip_ref.extractall(target_folder)
                result = {
                    "status": True,
                    "flattened": False,
                    "extracted_files": zip_ref.namelist()
                }

        result["path"] = target_folder
        result["zip_used"] = zip_file_path
        print(json.dumps(result))

    except Exception as e:
        print(json.dumps({"status": False, "error": str(e)}))
        sys.exit(1)

if __name__ == "__main__":
    main()
