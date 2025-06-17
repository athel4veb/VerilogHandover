import json
import argparse
from pathlib import Path

def detect_top_modules(source_json_path, output_json_path):
    with open(source_json_path, "r") as f:
        netlist = json.load(f)

    modules = netlist.get("modules", {})
    inst_map = {}

    for mod_name, mod_data in modules.items():
        for cell in mod_data.get("cells", {}).values():
            child = cell.get("type")
            if child:
                inst_map.setdefault(child, set()).add(mod_name)

    top_modules = [m for m in modules if m not in inst_map]

    with open(output_json_path, "w") as f_out:
        json.dump({"top_modules": top_modules}, f_out, indent=2)

    print(f"[✔] Top modules written to {output_json_path}")
    for mod in top_modules:
        print(" -", mod)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Detect top-level modules from Yosys JSON netlist")
    parser.add_argument("--source", required=True, help="Path to input netlist JSON file")
    parser.add_argument("--output", required=True, help="Path to output JSON file with top modules")

    args = parser.parse_args()
    detect_top_modules(args.source, args.output)
