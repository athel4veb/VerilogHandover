import os
import sys
import json

def ensure_folder_exists(folder_path):
    result = {"status": False, "path": folder_path}

    try:
        if not os.path.exists(folder_path):
            os.makedirs(folder_path)
            result["status"] = True
        else:
            result["status"] = True  # Folder already exists is still success
    except Exception as e:
        result["error"] = str(e)

    print(json.dumps(result))  # Output as JSON
    return result

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(json.dumps({
            "status": False,
            "error": "Usage: python create_folder_if_missing.py <folder_path>"
        }))
        sys.exit(1)

    target_folder = sys.argv[1]
    ensure_folder_exists(target_folder)
