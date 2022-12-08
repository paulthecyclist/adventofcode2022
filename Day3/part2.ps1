$ErrorActionPreference = "Stop"

function GetPriority([string] $letter) {    
    #Compare the two lists, take the common object and convert to a char
    $value = [int][char] $letter

    if ($value -gt 96) #lowercase
    {
        return $value - 96
    }
    else {  #uppercase
        return $value - 38
    }
}

$total = 0
$contents = Get-Content .\input.txt 
for ($i=0; $i -lt $contents.Length; $i+=3)
{
    $commonInFirstPair = (Compare-Object $contents[$i].ToCharArray() $contents[$i+1].ToCharArray() -PassThru -IncludeEqual -ExcludeDifferent)
    $commonLetter = (Compare-Object $commonInFirstPair $contents[$i+2].ToCharArray() -PassThru -IncludeEqual -ExcludeDifferent)[0]
    $total += GetPriority -letter $commonLetter 
}

Write-Output "Total is $total"