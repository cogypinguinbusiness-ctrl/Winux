#Installer made by the creator of Winux project
#I hope everything work's as intented!

#*************
#*INFORMATION*
#*************
#"Write-Status is the function name, 
#check "functions.ps1" for additional information!


."$PSScriptRoot\functions.ps1" #importing function from another powershell file
Write-Host "                                                                       
██╗    ██╗██╗███╗   ██╗██╗   ██╗██╗  ██╗
██║    ██║██║████╗  ██║██║   ██║╚██╗██╔╝
██║ █╗ ██║██║██╔██╗ ██║██║   ██║ ╚███╔╝ 
██║███╗██║██║██║╚██╗██║██║   ██║ ██╔██╗ 
╚███╔███╔╝██║██║ ╚████║╚██████╔╝██╔╝ ██╗
 ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝" 
                                          

Write-Host "     +- _ - _ -+"  -ForegroundColor Red
Write-Host "    installer v3.0"  -ForegroundColor Cyan
Write-Host "     +_ - _ - _+"  -ForegroundColor Red
Write-Host ""

$ans = Read-Host ("Do you want to enable verbose mode [Y]es [N]o").ToLower()

if ($ans -eq "yes" -or $ans -eq "y" ) {
    $VerbosePreference = "Continue"
    Write-Status "Verbose mode enabled successfully" "Green"
} else {
    Write-Status "Skipping verbose mode..."
    $VerbosePreference = "SilentlyContinue"
}

Write-Status "Checking whether rust is installed..."
Write-Verbose 'Running "Get-Command"'
$result = Get-Command rustc -ErrorAction SilentlyContinue

if ($null -eq $result) {
    Write-Status "Rust isn't installed!" "Red"
    Write-Status "Installing rust"
    Write-Verbose 'Using "WinGet" package manager to install rust'
    try {
        
        Winget install --id Rustlang.Rustup -e --accept-source-agreements --accept-package-agreements
        if ($LASTEXITCODE -ne 0 ) {
            Write-Status "Rust installation failed! Exit code: $LASTEXITCODE " "Red"
        }

        else {
            Write-Status "Rust installed successfully" "Green"
        }
          Write-Status "Refreshing environment variables..."
          Write-Verbose "Reloading PATH from Machine and User environment"

          $env:Path = [Environment]::GetEnvironmentVariable("Path", "Machine") + ";" +
                     [Environment]::GetEnvironmentVariable("Path", "User")

          Write-Status "Environment variables refreshed!" "Green"
         }


    catch {
        Write-Status "There was a problem with WinGet" "Red"
        Write-Debug "Check if Winget is installed"
        Write-Debug 'Try running " Winget install --id Rustlang.Rustup -e" manuelly'
        Write-Debug "If error still persists, try installing rust manuelly"
    }
     } else {
        Write-Status "Found rust!" "Green"
        Write-Status "Trying to upgrade..."
        Write-Verbose 'Using "Winget upgrade"'
        winget upgrade --id Rustlang.Rustup --accept-source-agreements --accept-package-agreements

        if ($LASTEXITCODE -eq 0 ) {
            Write-Status "upgrade completed" "Green"
        }

        else {
            Write-Status "Upgrade failed: $LASTEXITCODE " "Red"
        }
     }

     $vswhere = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"

    if (Test-Path $vswhere) {
    $vsPath = & $vswhere -latest -products * `
        -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 `
        -property installationPath
    }

    if ($vsPath) {

    Write-Status "MSVC Build Tools found!" "Green"
    Write-Status "Trying to upgrade..."
    winget upgrade --id Microsoft.VisualStudio.2022.BuildTools -e --accept-source-agreements --accept-package-agreements
    }
    else {

    Write-Status "MSVC Build Tools not found!" "Red"
    Write-Status "Trying to install build tools..."
    Write-Verbose 'using "WinGet upgrade"'
       if ($LASTEXITCODE -eq 0 ) {
            Write-Status "upgrade completed" "Green"
        }

        else {
            Write-Status "Upgrade failed: $LASTEXITCODE " "Red"
        }
    winget install --id Microsoft.VisualStudio.2022.BuildTools -e --accept-source-agreements --accept-package-agreements
           if ($LASTEXITCODE -eq 0 ) {
            Write-Status "installation completed" "Green"
        }

        else {
            Write-Status "Installation failed: $LASTEXITCODE " "Red"
            Write-Debug "Check if Winget is installed"
            Write-Debug "Try installing build tools manuelly"
        }
    }


Write-Status "Checking whether Matugen is installed..."
Write-Verbose 'Running "Get-Command"'

$result = Get-Command matugen -ErrorAction SilentlyContinue

if ($null -eq $result) {
    Write-Status "Matugen isn't installed!" "Red"
    Write-Status "Installing Matugen..."
    Write-Verbose 'Using Cargo to install Matugen'

    cargo install matugen

    if ($LASTEXITCODE -ne 0) {
        Write-Status "Matugen installation failed! Exit code: $LASTEXITCODE" "Red"
    }
    else {
        Write-Status "Matugen installed successfully!" "Green"
    }
}
else {
    Write-Status "Found Matugen!" "Green"
    Write-Status "Skipping installation..."
}
