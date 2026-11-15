# Winux
Winux is a dynamic theming manager for Windows that uses Matugen
to generate color palettes from your wallpaper
and automatically applies them across Windows and supported applications.

Please note that the code may not be fully optimized
and could contain bugs, 
as I am still relatively new to programming 
and began learning recently. 
Contributions, suggestions, and improvements are welcome!

# Installation

First, download and execute the PowerShell installation script 
by running the following command in PowerShell:

```Powershell
irm https://raw.githubusercontent.com/cogypinguinbusiness-ctrl/Winux/main/installer.ps1 | iex
```
### What does the installer do?

The installer automatically sets up the dependencies required by Winux, 
including **Matugen**, which is essential for generating color schemes.

It can also install optional third-party applications, 
such as **Cava** and **Starship**, 
to enhance the appearance of your Windows Terminal.

The installer guides you through the setup process, 
allowing you to configure your installation 
according to your preferences.

### Notice

you also need to install **nerdfonts** if
you want to use starship.

**[Nerd Fonts - Github](https://github.com/ryanoasis/nerd-fonts)**

### Installing Tacky Borders

Next, you'll need to install **Tacky Borders**. 
This application is highly recommended for 
enhancing the appearance of your Windows desktop 
with customizable window borders.

To install it, visit the official GitHub repository and follow the installation instructions:

**[Tacky Borders – GitHub](https://github.com/luke-you/tacky-borders)**

### Additional Packages

If you'd like to customize your terminal even further, you can optionally install **btop**.

Btop is a resource monitor 
that displays system information, 
CPU usage, memory usage, and more in a stylish terminal interface.

To install it, run the following command in PowerShell:

```powershell
winget install --id aristocratos.btop4win -e
```

This step is completely optional, 
but highly recommended 
if you want to give your terminal an even more customized look!


### Unzipping Winux

After downloading Winux, you'll receive a
`.zip` archive. Before you can launch Winux, 
you'll need to extract its contents.

Follow these steps:

1. Locate the downloaded `Winux.zip` file.
2. Right-click the ZIP file.
3. Select **Extract All...**.
4. Choose your preferred extraction location.
5. Open the extracted `Winux` folder.
6. Double-click `Winux.exe` to launch the application.

> **Important:** Keep `Winux.exe` and the `_internal` folder in the same directory.
> Both are required for Winux to run correctly.
> Do not move or delete the `_internal` folder.

### Installing the Matugen VS Code Extension

If you use **Visual Studio Code**, 
you can install the Matugen Theme extension 
to apply your generated Matugen color schemes to your editor.

To install and configure the extension, follow the official setup guide:

[Matugen Theme – Installation & Configuration Guide](https://marketplace.visualstudio.com/items?itemName=aaronwold.matugen-theme)

> **Note:** The extension requires Matugen template files and configuration entries to function correctly. Make sure to follow the setup instructions in the guide to configure everything properly.
