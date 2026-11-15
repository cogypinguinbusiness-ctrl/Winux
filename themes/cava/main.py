import sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parents[2]))

from color_manager import (
    primary,
    secondary,
    tertiary,
    background,
    on_background,
)

location = Path.home() / ".config" / "cava" / "config"

if location.exists():
    settings_file = location
else:
    print("Config file for CAVA was not found")
    answer = input("Do you want to create the file [Y]es [N]o? ").lower()

    if answer in ("yes", "y"):
        try:
            location.parent.mkdir(parents=True, exist_ok=True)
            location.touch(exist_ok=True)
            settings_file = location
            print("[creating config file...]")
            print("[SUCCESSFUL]")
        except Exception:
            print("An error occurred and the config file couldn't be created")
            sys.exit()

    else:
        sys.exit()

data = f"""[general]
live-config = 1

[color]
gradient = 1
gradient_count = 3
gradient_color_1 = '{primary}'
gradient_color_2 = '{secondary}'
gradient_color_3 = '{tertiary}'
foreground = '{on_background}'
"""

with open(settings_file, "w") as file:
    file.write(data)