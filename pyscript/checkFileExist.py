import os
import sys

def file_exists(filepath):
    return os.path.isfile(filepath)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python check_file_exists.py <file_path>")
        sys.exit(1)

    filepath = sys.argv[1]
    exists = file_exists(filepath)
    print(exists)
