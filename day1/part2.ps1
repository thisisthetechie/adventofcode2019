# AdventOfCode 2019 - Day 1 Part 2
$values = get-content .\values.txt
$values=$values.split("`n`r")

function getRequiredFuel ( $module ) {
    return $( [math]::floor( $module / 3 ) ) - 2
}

$fuel = 0
$additionalFuel = 0
foreach ( $module in $values ) {
    
    $moduleFuel = getRequiredFuel($module)
    $fuel += $moduleFuel
    write-host $moduleFuel
    if ( $moduleFuel -gt 0 ) {
        $fuelFuel = $moduleFuel
        for ( $fuelFuel = $moduleFuel; $fuelFuel -gt 0; $fuelFuel = getRequiredFuel($fuelFuel) ) { 
            $additionalFuel += $fuelFuel
            write-host $fuelFuel
        }
    }
}

write-host "Fuel count = $fuel"
write-host "Total count = $additionalFuel"