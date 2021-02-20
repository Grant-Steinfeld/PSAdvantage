function Invoke-GHPush {
    <#
        .Synopsis
        Commits and pushes a local changes to GitHub (must be present under custom/ folder)

        .Example
        $reponame = 'testing'

        New-GHRepo $reponame -clone
        Copy-Item ..\*.ps1  .\custom\$reponame

        Invoke-GHPush $reponame        
    #>
    param(
        $reponame
    )

    $defaultPath = ".\custom"
    $path = $defaultPath + "\$reponame"

    if (Test-Path $path) {
        Push-Location

        Set-Location $path
        if (git status --porcelain) { # if there are files to check in, this call is not $null  
            git add .
            git commit -m 'update automation'
            git push
        }
        Pop-Location
    }
}