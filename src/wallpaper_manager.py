from pathlib import Path
import getpass
import subprocess
import winreg

name = getpass.getuser()

wallpaper_key = winreg.OpenKey(
    winreg.HKEY_CURRENT_USER,       #reads current BG from regeditor
    r"Control Panel\Desktop"
)

newest_file = Path(winreg.QueryValueEx(wallpaper_key, "WallPaper")[0])

winreg.CloseKey(wallpaper_key)
if newest_file.exists():

    result=subprocess.run([
        rf"C:\\Users\\{name}\\.cargo\bin\\matugen.exe",     #runs matugen with the current BG
        "image",
        str(newest_file),"--json", "hex", "--source-color-index", "0",
    ],      capture_output=True,
            text = True 
            
        )
    