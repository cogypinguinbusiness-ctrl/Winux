import yaml
from pathlib import Path
import sys
sys.path.append(str(Path(__file__).resolve().parents[2]))
import subprocess

from color_manager import (
    primary,
    secondary,
    tertiary,
    background,
    on_background,
)

location = Path.home() / ".config" / "tacky-borders" / "config.yaml"

if location.exists():
    settings_file = location
else :
    print("Config file for tacky borders was not found")
    answer = input(("Do you want to create the file [Y]es [N]o")).lower()
    if answer in ("yes", "y"):
        try:
            location.parent.mkdir(parents=True, exist_ok=True)
            location.touch(exist_ok=True)
            settings_file = location
            print("[creating config file...]")
            print("[SUCCESSFUL]")
        except:
            print("An error occured and the config file couldn't be created")

data = {
      "enable_ipc_server": True,
     "watch_config_changes": True,
    "global": {
        "border_width": 1,
        "border_offset": -1,
        "border_radius": "Square",
        "border_z_order": "AboveWindow",
        "follow_native_border": True,
        "initialize_delay": 200,
        "unminimize_delay": 150,

        "active_color": {
            "colors": [primary, secondary],
            "direction": "45deg"
        },

        "inactive_color": {
            "colors": [background, on_background],
            "direction": {
                "start": [0.0, 1.0],
                "end": [1.0, 0.0]
            }
        },

        "komorebi_colors": {
            "stack_color": tertiary,
            "monocle_color": primary,
            "floating_color": secondary,
            "enabled": False
        }
    }
}

with open(settings_file, "w") as file:
    yaml.safe_dump(data, file, sort_keys=False)

tacky_path = subprocess.run(
    [
        "powershell.exe",
        "-NoProfile",
        "-Command",
        "(Get-CimInstance Win32_Process -Filter \"Name='tacky-borders.exe'\").ExecutablePath"
    ],
    capture_output=True,
    text=True
).stdout.strip()

if tacky_path:
    subprocess.run(
        [tacky_path, "reload"],
        check=True,
        capture_output=True,
        text=True
    )