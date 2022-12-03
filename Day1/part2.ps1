$elfTotal = 0
$elves = $()

foreach($line in Get-Content .\input1.txt) {
    
    #total elf calories
    if($line -match '\d+'){
        $elfTotal+= [int]$line
    }
    else {
        #store which elf has most calories
        if ($elfTotal -gt $maxTotal)
        {
            $maxElf = $currentElf
            $maxTotal = $elfTotal
        }

        #reset for next elf
        $elfTotal = 0
        $currentElf++
    }
}

Write-Output "Elf with most calories is $maxElf with $maxTotal"