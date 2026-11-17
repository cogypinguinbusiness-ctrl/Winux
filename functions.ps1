function Write-Status {
    param ( 
        [string] $msg,
        [string] $col = "yellow"
    )
    Write-Host "["  -ForegroundColor Gray -NoNewline
    Write-Host $msg -ForegroundColor $col -NoNewline
    Write-Host "]"  -ForegroundColor Gray
}

