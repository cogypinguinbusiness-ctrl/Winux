import subprocess

original_run = subprocess.run

def hidden_run(*args, **kwargs):
    kwargs.setdefault("creationflags", subprocess.CREATE_NO_WINDOW)
    return original_run(*args, **kwargs)

subprocess.run = hidden_run
import time
import winreg
import importlib

import wallpaper_manager
import color_manager
import themes.terminal.main
import themes.tackyborders.main
import themes.cava.main

previous_wallpaper = wallpaper_manager.newest_file

while True:
    key = winreg.OpenKey(
        winreg.HKEY_CURRENT_USER,
        r"Control Panel\Desktop"
    )

    current_wallpaper = winreg.QueryValueEx(key, "WallPaper")[0]
    winreg.CloseKey(key)

    if current_wallpaper != str(previous_wallpaper):
        importlib.reload(wallpaper_manager)
        importlib.reload(color_manager)
        importlib.reload(themes.terminal.main)
        importlib.reload(themes.tackyborders.main)
        importlib.reload(themes.cava.main)

        previous_wallpaper = wallpaper_manager.newest_file

    time.sleep(1)