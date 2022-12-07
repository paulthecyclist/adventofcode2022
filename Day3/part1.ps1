$ErrorActionPreference = "Stop"

function GetPriorityValue([string] $rucksack) {
    $compartmentA = ($rucksack.Substring(0,$rucksack.Length/2)).ToCharArray()
    $compartmentB = ($rucksack.Substring($rucksack.Length/2)).ToCharArray()

    #Compare the two lists, take the common object and convert to a char
    $commonItem = [int][char] ((Compare-Object $compartmentA $compartmentB -PassThru -IncludeEqual -ExcludeDifferent)[0])

    if ($commonItem -gt 96) #lowercase
    {
        return $commonItem - 96
    }
    else {  #uppercase
        return $commonItem - 38
    }
}

$total = 0
Get-Content .\input.txt | ForEach-Object { $total += GetPriorityValue $_}

Write-Output "Total is $total"