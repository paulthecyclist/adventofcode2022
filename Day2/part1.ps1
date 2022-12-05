#Rock = A, X
#Paper = B, Y
#Scissors = C, Z
function GetRoundTotal([string] $player1, [string] $player2) {
    $score = 0
    Switch ($player2) {
        'X' {
            $score = 1
            Switch ($player1) {
                'A' { $score += 3 }
                'B' { $score += 0 }
                'C' { $score += 6 }
            }
        }
        'Y' {
            $score = 2
            Switch ($player1) {
                'A' { $score += 6 }
                'B' { $score += 3 }
                'C' { $score += 0 }
            }
        }
        'Z' {
            $score = 3
            Switch ($player1) {
                'A' { $score += 0 }
                'B' { $score += 6 }
                'C' { $score += 3 }
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