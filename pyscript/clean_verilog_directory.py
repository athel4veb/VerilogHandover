import os
import sys

# Keywords that indicate a file is a testbench
TESTBENCH_KEYWORDS = ['tb', 'testbench', '_tb', '-tb', 'test']

def is_testbench_file(filename):
    name = filename.lower()
    return any(kw in name for kw in TESTBENCH_KEYWORDS)

def clean_directory(target_dir):
    removed_files = []

    for root, _, files in os.walk(target_dir):
        for fname in files:
            full_path = os.path.join(root, fname)

            if not fname.endswith('.v') or is_testbench_file(fname):
                try:
                    os.remove(full_path)
                    removed_files.append(full_path)
                except Exception as e:
                    print(f"❌ Failed to delete {full_path}: {e}")

    print(f"✅ Removed {len(removed_files)} files:")
    for f in removed_files:
        print(f" - {f}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python clean_verilog_directory.py <target_directory>")
        sys.exit(1)

    clean_directory(sys.argv[1])
