# AdventOfCode 2019 - Day 1 Part 2
$values = get-content .\values.txt
$values=$values.split("`n`r")

function getRequiredFuel ( $module ) {
    return $( [math]::floor( $module / 3 ) ) - 2
}

$fuel = 0
foreach ( $module in $values ) {
    $additionalFuel = 0
    $moduleFuel = getRequiredFuel($module)

    $fuel += $( $moduleFuel + $additionalFuel )
}

write-host "Fuel count = $fuel"