
import os
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

settings_file = None
import json

locations = [
    Path(os.environ["LOCALAPPDATA"]) / "Packages" / "Microsoft.WindowsTerminal_8wekyb3d8bbwe" / "LocalState" / "settings.json",
    Path(os.environ["LOCALAPPDATA"]) / "Packages" / "Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe" / "LocalState" / "settings.json",
    Path(os.environ["LOCALAPPDATA"]) / "Packages" / "Microsoft.WindowsTerminalCanary_8wekyb3d8bbwe" / "LocalState" / "settings.json",
    Path(os.environ["LOCALAPPDATA"]) / "Microsoft" / "Windows Terminal" / "settings.json"
]

for location in locations:
    if location.exists():
        settings_file = location
        break

settings = open(settings_file)
data = json.load(settings)

if "schemes" in data:
    data["schemes"] = [scheme for scheme in data["schemes"] if scheme["name"] != "Winux"]

    data["schemes"].append({
        "name": "Winux",
        "background": background,
        "foreground": on_background,
        "black": background,
        "red": tertiary,
        "green": secondary,
        "yellow": primary,
        "blue": primary,
        "purple": tertiary,
        "cyan": secondary,
        "white": on_background,
        "brightBlack": background,
        "brightRed": tertiary,
        "brightGreen": secondary,
        "brightYellow": primary,
        "brightBlue": primary,
        "brightPurple": tertiary,
        "brightCyan": secondary,
        "brightWhite": on_background
    })

    data["profiles"]["defaults"]["colorScheme"] = "Winux"

    for profile in data["profiles"]["list"]:
        if profile.get("colorScheme") is not None:
            profile["colorScheme"] = "Winux"

    with open(settings_file, "w") as file:
        json.dump(data, file, indent=4)
