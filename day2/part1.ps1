# AdventOfCode 2019 - Day 1 Part 2
$values = get-content .\values.txt
$values=$values.split(",")

for ($a = 0; $a -lt $values.count; $a += 4) {
    $newValues += ,@($values[$a..($a+3)]);
 }


 $z=for($i=0; $i -lt $values.length; $i+=4){ ,($values[$i]..$values[$i+3])}

function intCode( $opCode, $input1, $input2 ) {
    write-host $opCode
    write-host $input1
    write-host $input2
    switch ( $opCode ) {
        1 { 
            return $( $input1 + $input2 )
            break
        }
        2 {
            return $( $input1 * $input2 )
            break
        }
        99 {
            write-host "Final value = $( $values[0] )"
            exit
        }
        default {
            Write-host "An error has occured"
            exit
        }
    }
}


for ( $i = 0; $i -lt $values.count; $i = $i + 4 ) {
    $values[$values[$i+3] - 1] = intCode($values[$i], $values[$i+1], $values[$i+2])
}

