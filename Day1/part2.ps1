$elfTotal = 0
$elves = @()

foreach($line in Get-Content .\input1.txt) {
    
    #total elf calories
    if($line -match '\d+'){
        $elfTotal+= [int]$line
    }
    else {
        $elves+= $elfTotal

        #reset for next elf    
        $elfTotal = 0
    }
}

$elves = $elves | Sort-Object -Descending 
$top3Elves = $elves[0] + $elves[1] + $elves[2]

Write-Output "Top3 Elf total is $top3Elves"