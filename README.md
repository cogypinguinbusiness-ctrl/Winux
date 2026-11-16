# Winux
Winux is a dynamic theming manager for Windows that uses Matugen
to generate color palettes from your wallpaper
and automatically applies them across Windows and supported applications.

Please note that the code may not be fully optimized
and could contain bugs, 
as I am still relatively new to programming 
and began learning recently. 
Contributions, suggestions, and improvements are welcome!

# !IMPORTANT


The current PowerShell installer is not working as intended.
The issue is most likely related to missing build dependencies, 
particularly the required C/C++ linker needed to compile Matugen from source 
using Rust's Cargo package manager.

Therefore, I will be providing a manual installation guide explaining how to install **Matugen**
and all other required dependencies.

Please follow the manual installation instructions until the installer has been fixed.

Thank you for your understanding!



# Installation

(Skip this step, the installer does not work)

First, download and execute the PowerShell installation script 
by running the following command in PowerShell:

```Powershell
irm https://raw.githubusercontent.com/cogypinguinbusiness-ctrl/Winux/main/installer.ps1 | iex
```
### What does the installer do?

The installer automatically sets up the dependencies required by Winux, 
including **Matugen**, which is essential for generating color schemes.

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


# Manual Installation Guide

Follow these instructions to manually install Winux and all required dependencies.

## 1. Prerequisites

Before installing Winux, make sure you have the following components installed:

- Rust and Cargo
- Microsoft C++ Build Tools (MSVC)
- Windows SDK

These components are required to compile Matugen from source on Windows.

## 2. Installing Rust

Download and install Rust using the official Rustup installer:

https://rustup.rs/

Alternatively, install it through PowerShell:

```powershell
winget install --id Rustlang.Rustup -e
```

After installation, open a new PowerShell window and verify that Rust and Cargo are working:

```powershell
rustc --version
cargo --version
```

## 3. Installing Microsoft C++ Build Tools

Matugen requires a working compiler and linker to build from source.

1. Visit the official download page:

   https://visualstudio.microsoft.com/visual-cpp-build-tools/

2. Download and launch the installer.
3. Select **Desktop development with C++**.
4. Make sure the MSVC compiler and Windows SDK are selected.
5. Complete the installation.

Afterwards, restart your terminal.

## 4. Installing Matugen

Once Rust and the required build tools are installed, open PowerShell and execute:

```powershell
cargo install matugen
```

Cargo will download, compile and install Matugen.

To verify that the installation was successful, run:

```powershell
matugen --version
```

## 5. Installing Additional Dependencies

### Cava

Install Cava using WinGet:

```powershell
winget install --id karlstav.cava -e
```

### Starship

Install Starship using WinGet:

```powershell
winget install --id Starship.Starship -e
```

## 6. Optional Components

### Nerd Fonts

If you want to use Starship with icons and special symbols, install a Nerd Font.

https://github.com/ryanoasis/nerd-fonts

### Tacky Borders

Tacky Borders is recommended for additional desktop customization.

https://github.com/luke-you/tacky-borders

### btop

An optional terminal-based resource monitor.

```powershell
winget install --id aristocratos.btop4win -e
```

### Matugen VS Code Extension

If you use Visual Studio Code, you can install the Matugen Theme extension.

https://marketplace.visualstudio.com/items?itemName=aaronwold.matugen-theme

Follow its configuration guide to connect it with your Matugen templates.

## 7. Downloading and Launching Winux

1. Download the latest Winux release.
2. Locate the downloaded ZIP archive.
3. Right-click it and select **Extract All...**.
4. Choose your preferred extraction location.
5. Open the extracted Winux folder.
6. Double-click `Winux.exe` to launch the application.

> **Important:** Keep `Winux.exe` and the `_internal` folder in the same directory. Both are required for Winux to work correctly.

## 8. Troubleshooting

If you encounter problems during installation, make sure all required dependencies are installed correctly.

If Matugen cannot be found, try restarting PowerShell so that the updated PATH environment variables are loaded.

If you encounter a compilation error, make sure the MSVC compiler and linker were installed correctly.

If the problem persists, please report the error along with the relevant installation logs.




# Credits & Special Thanks

A huge thank you to the creators and maintainers of Matugen, Cava, Starship, the Matugen VS Code Extension, and Tacky Borders!

Without your amazing work and contributions to the open-source community, this project wouldn't have been possible.

Thank you for making tools that inspire others to create something of their own!
