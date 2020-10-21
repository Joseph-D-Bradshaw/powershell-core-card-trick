$suits = 'Hearts','Diamonds','Spades','Clubs'
$values = 'A','2','3','4','5','6','7','8','9','10','J','Q','K'
[System.Collections.ArrayList]$cards = @()

function shuffle($cards) {
    return $cards | Sort-Object {Get-Random}
}

function strip21($cards) {
    return $cards[0..20]
}

function inPiles($cards) {
    # Ask Per about this
    return $cards[0..6], $cards[7..13], $cards[13..20]
}

function sortCards($choice, $a, $b, $c) {
    switch ($choice)
    {
        "1" { return $b + $a + $c }
        "2" { return $a + $b + $c }
        "3" { return $b + $c + $a }
    }
}

foreach ($suit in $suits) {
    foreach ($value in $values) {
        $cards += [System.Tuple]::Create($suit, $value)
    }
}

$cards = shuffle($cards)

$cards = $cards[0..20]

$pile1 = $cards[0..6]
$pile2 = $cards[7..13]
$pile3 = $cards[13..20]

Write-Output "1: $pile1"
Write-Output "2: $pile2"
Write-Output "3: $pile3"

$choice = Read-Host -Prompt 'Which row is your card in?'

$cards = sortCards $choice $pile1 $pile2 $pile3

$pile1 = @()
$pile2 = @()
$pile3 = @()

for ($i = 20; $i -gt -1; $i = $i - 3) {
    $pile1 += $cards[$i]
    $pile2 += $cards[$i-1]
    $pile3 += $cards[$i-2]
}

Write-Output "1: $pile1"
Write-Output "2: $pile2"
Write-Output "3: $pile3"

$choice = Read-Host -Prompt 'Which row is your card in?'
$cards = sortCards $choice $pile1 $pile2 $pile3

$pile1 = @()
$pile2 = @()
$pile3 = @()

for ($i = 20; $i -gt -1; $i = $i - 3) {
    $pile1 += $cards[$i]
    $pile2 += $cards[$i-1]
    $pile3 += $cards[$i-2]
}

Write-Output "1: $pile1"
Write-Output "2: $pile2"
Write-Output "3: $pile3"

$choice = Read-Host -Prompt 'Which row is your card in?'
$cards = sortCards $choice $pile1 $pile2 $pile3

Write-Output "This is your card:" $cards[10]