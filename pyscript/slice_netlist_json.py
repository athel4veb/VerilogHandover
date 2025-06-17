import os
import json
import argparse

def slice_netlist_json(source_path, dest_path, chunk_size=100):
    os.makedirs(dest_path, exist_ok=True)

    with open(source_path, 'r') as f:
        netlist = json.load(f)

    top_module_name = list(netlist['modules'].keys())[0]
    top_data = netlist['modules'][top_module_name]

    # Save top-level I/O
    top_io = {
        "top_module": top_module_name,
        "ports": top_data.get("ports", {}),
        "netnames": top_data.get("netnames", {})
    }
    with open(os.path.join(dest_path, "top_io.json"), "w") as f:
        json.dump(top_io, f, indent=2)

    # Save summary of cell types
    cells = top_data.get("cells", {})
    cell_summary = {}
    for _, cell_data in cells.items():
        cell_type = cell_data["type"]
        cell_summary[cell_type] = cell_summary.get(cell_type, 0) + 1
    with open(os.path.join(dest_path, "cell_summary.json"), "w") as f:
        json.dump(cell_summary, f, indent=2)

    # Slice cells into chunks
    cell_items = list(cells.items())
    for i in range(0, len(cell_items), chunk_size):
        chunk = dict(cell_items[i:i + chunk_size])
        out_path = os.path.join(dest_path, f"cells_chunk_{i // chunk_size + 1}.json")
        with open(out_path, "w") as f:
            json.dump(chunk, f, indent=2)

    print(f"Slicing complete. Outputs written to {dest_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Slice Yosys netlist JSON into manageable parts.")
    parser.add_argument('--source', required=True, help='Path to source netlist JSON')
    parser.add_argument('--dest', required=True, help='Destination folder to write sliced files')
    parser.add_argument('--chunk_size', type=int, default=100, help='Number of cells per output chunk')

    args = parser.parse_args()
    slice_netlist_json(args.source, args.dest, args.chunk_size)
