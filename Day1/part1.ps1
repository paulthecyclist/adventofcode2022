$elfTotal = 0
$maxTotal = 0

foreach($line in Get-Content .\input1.txt) {
    
    #total elf calories
    if($line -match '\d+'){
        $elfTotal+= [int]$line
    }
    else {
        #store which elf has most calories
        if ($elfTotal -gt $maxTotal)
        {            
            $maxTotal = $elfTotal
        }

        #reset for next elf
        $elfTotal = 0        
    }
}

Write-Output "Elf with most calories has $maxTotal"