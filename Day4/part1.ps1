$ErrorActionPreference = "Stop"

function GetRange([string] $range) {    
    
    $limits = $range.Split('-')
    
    return [int]$limits[0]..[int]$limits[1]    
}

$total = 0
$content = Get-Content .\input.txt 

foreach ($pair in $content)
{
    $pairs = $pair.Split(',') 
    $range1 = GetRange -range $pairs[0]
    $range2 = GetRange -range $pairs[1]

    $overlap = Compare-Object $range1 $range2 -PassThru -IncludeEqual -ExcludeDifferent
    if ($overlap.Length -eq $range1.Length -or $overlap.Length -eq $range2.Length)
    {
        $total++
    }    
}

Write-Output "Total is $total"