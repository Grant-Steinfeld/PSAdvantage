function Get-GHLatestRun {
    <#
        .Synopsis
        Gets the last job that ran for the specified repo 

        .Example
        Get-GHLatestRun powershell powershell
    #>
    param(
        [Parameter(Mandatory)]
        $owner,
        [Parameter(Mandatory)]
        $repo,
        $AccessToken,
        [Switch]$Raw
    )    
    
    $run = Get-GHRun -owner $owner -repo $repo -AccessToken $AccessToken -Raw:$Raw
    if ($run) { $run[0] }    
}