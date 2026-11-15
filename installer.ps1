Write-Host "                                                                       
  _____            ____  _____   ______    ____   ____                 
 |\    \   _____  |    ||\    \ |\     \  |    | |    |_____      _____
 | |    | /    /| |    | \\    \| \     \ |    | |    |\    \    /    /
 \/     / |    || |    |  \|    \  \     ||    | |    | \    \  /    / 
 /     /_  \   \/ |    |   |     \  |    ||    | |    |  \____\/____/  
|     // \  \   \ |    |   |      \ |    ||    | |    |  /    /\    \  
|    |/   \ |    ||    |   |    |\ \|    ||    | |    | /    /  \    \ 
|\ ___/\   \|   /||____|   |____||\_____/||\___\_|____|/____/ /\ \____\
| |   | \______/ ||    |   |    |/ \|   ||| |    |    ||    |/  \|    |
 \|___|/\ |    | ||____|   |____|   |___|/ \|____|____||____|    |____|
    \(   \|____|/   \(       \(       )/      \(   )/    \(        )/  
     '      )/       '        '       '        '   '      '        '   
            '                                                          "

Write-Host "This is the Winux installer. It will install all the applications required for Winux to work."

Write-Host "[Installing Rust and Cargo...]"
winget install --id Rustlang.Rustup -e *> $null
cargo install matugen *> $null
$answer = (Read-Host "Do you want to install cava [Y]es [N]o [A] yes to all").ToLower()

if ($answer -eq "y" -or $answer -eq "yes") {
Write-Host "[Installing cava...]"
winget install --id karlstav.cava -e *> $null
}
elseif ($answer -eq "n" -or $answer -eq "no") {
    Write-Host "Cava will be skipped"
}
elseif ($answer -eq "a" -or $answer -eq "yes to all") {
    Write-Host "[Installing cava...]"
    winget install --id karlstav.cava -e *> $null
    Write-Host "[Installing Starship...]"
    winget install --id Starship.Starship -e *> $null
}

if ($answer -ne "a" -and $answer -ne "yes to all") {
$banswer = (Read-Host "Do you want to install Starship [Y]es [N]o").ToLower()

if ($banswer -eq "y" -or $banswer -eq "yes") {
    Write-Host "[Installing Starship...]"
    winget install --id Starship.Starship -e *> $null
}
elseif ($banswer -eq "n" -or $banswer -eq "no") {
    Write-Host "Starship will be skipped"
}
  }

Write-Host "[*] Installer finished successfully [*]"

