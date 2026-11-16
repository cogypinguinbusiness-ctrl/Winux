from wallpaper_manager import newest_file

if newest_file.exists():

    from wallpaper_manager import result
    import json

    color = json.loads(result.stdout)

    primary = color["colors"]["primary"]["dark"]["color"]
    on_primary = color["colors"]["on_primary"]["dark"]["color"]
    secondary = color["colors"]["secondary"]["dark"]["color"]
    tertiary = color["colors"]["tertiary"]["dark"]["color"]
    background = color["colors"]["background"]["dark"]["color"]
    on_background = color["colors"]["on_background"]["dark"]["color"]
    surface = color["colors"]["surface"]["dark"]["color"]
    on_surface = color["colors"]["on_surface"]["dark"]["color"]
    outline = color["colors"]["outline"]["dark"]["color"]

    base16 = color["base16"]

    base00 = base16["base00"]["dark"]["color"]
    base01 = base16["base01"]["dark"]["color"]
    base02 = base16["base02"]["dark"]["color"]
    base03 = base16["base03"]["dark"]["color"]
    base04 = base16["base04"]["dark"]["color"]
    base05 = base16["base05"]["dark"]["color"]
    base06 = base16["base06"]["dark"]["color"]
    base07 = base16["base07"]["dark"]["color"]
    base08 = base16["base08"]["dark"]["color"]
    base09 = base16["base09"]["dark"]["color"]
    base0A = base16["base0a"]["dark"]["color"]
    base0B = base16["base0b"]["dark"]["color"]
    base0C = base16["base0c"]["dark"]["color"]
    base0D = base16["base0d"]["dark"]["color"]
    base0E = base16["base0e"]["dark"]["color"]
    base0F = base16["base0f"]["dark"]["color"]