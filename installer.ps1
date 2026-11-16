#Installer made by me, the creator of the Winux project
#I hope everything work's as it should!
#had to update the installer script because the old one didn't work properly!

Write-Host "                                                                       
██╗    ██╗██╗███╗   ██╗██╗   ██╗██╗  ██╗
██║    ██║██║████╗  ██║██║   ██║╚██╗██╔╝
██║ █╗ ██║██║██╔██╗ ██║██║   ██║ ╚███╔╝ 
██║███╗██║██║██║╚██╗██║██║   ██║ ██╔██╗ 
╚███╔███╔╝██║██║ ╚████║╚██████╔╝██╔╝ ██╗
 ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝" 
                                          
$LASTEXITCODE = $process
Write-Host "     - - - - -"  -ForegroundColor Red
Write-Host "    installer v2.0"  -ForegroundColor Cyan
Write-Host ""
Write-Host "[" -ForegroundColor Gray -NoNewLine
Write-Host "Installing rust..."   -ForegroundColor yellow -NoNewLine
Write-Host "]" -ForegroundColor Gray -NoNewLine
Write-Host ""

try { 

    winget install --id Rustlang.Rustup -e *> $null
    Write-Host "[" -ForegroundColor Gray -NoNewline
    Write-Host "*Rust was installed successfully*" -ForegroundColor Green -NoNewline  #Tries installing rust
    Write-Host "]" -ForegroundColor Gray -NoNewLine
    Write-Host ""

} catch {

    if ($LASTEXITCODE -ne 0) {
        Write-Host "[" -ForegroundColor Gray -NoNewLine
        Write-Host "*Installation failed!"   -ForegroundColor Red -NoNewLine                                         #if rust cannot be installed, it powershell prints an error
        Write-Host "]" -ForegroundColor Gray  -NoNewLine    
        Write-Host ""                                      
        Write-Host $_.Exception.Message -ForegroundColor DarkRed 
        Write-Host ""
    }

}

try {
    Write-Host "[" -ForegroundColor Gray -NoNewline
    Write-Host "Trying to refrash pwsh path..." -ForegroundColor Yellow -NoNewline  #Tries to refrash path
    Write-Host "]" -ForegroundColor Gray -NoNewLine
    $env:Path = [Environment]::GetEnvironmentVariable("Path", "Machine") + ";" +
                [Environment]::GetEnvironmentVariable("Path", "User")
                Write-Host ""
                if ($?) {  Write-Host "[" -ForegroundColor Gray -NoNewline
                           Write-Host "*SUCCESSFUL*" -ForegroundColor Green -NoNewline  
                           Write-Host "]" -ForegroundColor Gray -NoNewLine}
                           Write-Host ""
} catch {
        Write-Host ""
        Write-Host "[" -ForegroundColor Gray -NoNewLine
        Write-Host "*FAILED TO REFRESH PATH!"   -ForegroundColor Red -NoNewLine 
        Write-Host "]" -ForegroundColor Gray -NoNewLine
        Write-Host ""
}

Write-Host "[" -ForegroundColor Gray -NoNewLine
Write-Host "Installing matugen..."   -ForegroundColor yellow -NoNewLine
Write-Host "]" -ForegroundColor Gray -NoNewLine
Write-Host ""

try {
    cargo install matugen *> $null
    if ($LASTEXITCODE -eq 0) {
    Write-Host "[" -ForegroundColor Gray -NoNewline
    Write-Host "*Matugen was installed successfully*" -ForegroundColor Green -NoNewline  #Tries installing matugen
    Write-Host "]" -ForegroundColor Gray -NoNewLine
    Write-Host ""
}
 }
catch {
        Write-Host ""
        Write-Host "[" -ForegroundColor Gray -NoNewLine
        Write-Host "*FAILED TO INSTALL MATUGEN!"   -ForegroundColor Red -NoNewLine 
        Write-Host "]" -ForegroundColor Gray -NoNewLine
        Write-Host ""
}
    try {
    Write-Host "[" -ForegroundColor Gray -NoNewline
    Write-Host "Trying to refrash pwsh path..." -ForegroundColor Yellow -NoNewline  #Tries to refrash path
    Write-Host "]" -ForegroundColor Gray -NoNewLine
    $env:Path = [Environment]::GetEnvironmentVariable("Path", "Machine") + ";" +
                [Environment]::GetEnvironmentVariable("Path", "User")
                Write-Host ""
                if ($?) {  Write-Host "[" -ForegroundColor Gray -NoNewline
                           Write-Host "*SUCCESSFUL*" -ForegroundColor Green -NoNewline  
                           Write-Host "]" -ForegroundColor Gray -NoNewLine}
                           Write-Host ""
} catch {
        Write-Host ""
        Write-Host "[" -ForegroundColor Gray -NoNewLine
        Write-Host "*FAILED TO REFRESH PATH!"   -ForegroundColor Red -NoNewLine 
        Write-Host "]" -ForegroundColor Gray -NoNewLine
        Write-Host ""
}

    Write-Host "[" -ForegroundColor Gray -NoNewLine
    Write-Host "Installing cava..."   -ForegroundColor yellow -NoNewLine
    Write-Host "]" -ForegroundColor Gray -NoNewLine
    Write-Host ""   

    try { 

    winget install --id karlstav.cava -e *> $null
    Write-Host "[" -ForegroundColor Gray -NoNewline
    Write-Host "*Cava was installed successfully*" -ForegroundColor Green -NoNewline  
    Write-Host "]" -ForegroundColor Gray -NoNewLine
    Write-Host ""

} catch {

    if ($LASTEXITCODE -ne 0) {
        Write-Host "[" -ForegroundColor Gray -NoNewLine
        Write-Host "*Installation failed!"   -ForegroundColor Red -NoNewLine                                        
        Write-Host "]" -ForegroundColor Gray  -NoNewLine    
        Write-Host ""                                      
        Write-Host $_.Exception.Message -ForegroundColor DarkRed 
        Write-Host ""
    }

}

    Write-Host "[" -ForegroundColor Gray -NoNewLine
    Write-Host "Installing starship..."   -ForegroundColor yellow -NoNewLine
    Write-Host "]" -ForegroundColor Gray -NoNewLine
    Write-Host ""   

    try { 

    winget install --id Starship.Starship -e *> $null
    Write-Host "[" -ForegroundColor Gray -NoNewline
    Write-Host "*Starship was installed successfully*" -ForegroundColor Green -NoNewline  
    Write-Host "]" -ForegroundColor Gray -NoNewLine
    Write-Host ""

} catch {

    if ($LASTEXITCODE -ne 0) {
        Write-Host "[" -ForegroundColor Gray -NoNewLine
        Write-Host "*Installation failed!"   -ForegroundColor Red -NoNewLine                                        
        Write-Host "]" -ForegroundColor Gray  -NoNewLine    
        Write-Host ""                                      
        Write-Host $_.Exception.Message -ForegroundColor DarkRed 
        Write-Host ""
    }

}

Write-Host " =============== [ FINISHED ] =============== "

