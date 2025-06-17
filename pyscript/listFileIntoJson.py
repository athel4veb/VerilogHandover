import sys
import os
import json

# Get folder path from command-line argument (e.g. sys.argv[1])
if len(sys.argv) < 2:
    print(json.dumps({"error": "No folder argument provided"}))
    sys.exit(1)

folder = sys.argv[1]
file_paths = []

for root, dirs, files in os.walk(folder):
    for file in files:
        file_paths.append(os.path.join(root, file))

# Output as JSON array
print(json.dumps({"files": file_paths}))
