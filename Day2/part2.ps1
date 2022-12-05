#Rock = A //1
#Paper = B //2
#Scissors = C //3
# X = lose //0
# Y = Draw //3
# Z = Win //3

function GetRoundTotal([string] $player1, [string] $player2) {
    $score = 0
    Switch ($player2) {
        'X' {            
            Switch ($player1) {
                'A' { $score += 3 }
                'B' { $score += 1 }
                'C' { $score += 2 }
            }
        }
        'Y' {
            $score = 3
            Switch ($player1) {
                'A' { $score += 1 }
                'B' { $score += 2 }
                'C' { $score += 3 }
            }
        }
        'Z' {
            $score = 6
            Switch ($player1) {
                'A' { $score += 2 }
                'B' { $score += 3 }
                'C' { $score += 1 }
            }
        }
    }
        
    return $score
}

$total = 0

foreach ($line in Get-Content .\input.txt) {
    
    $player1 = $line.Substring(0, 1)
    $player2 = $line.Substring(2, 1)

    $total += GetRoundTotal -player1 $player1 -player2 $player2
}

Write-Output "Total is $total"