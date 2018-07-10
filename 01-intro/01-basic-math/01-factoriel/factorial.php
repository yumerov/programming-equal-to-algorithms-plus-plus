<?php

function factorial(int $n): int 
{
    if (in_array($n, [0, 1])) {
        return 1;
    }

    $f = 1;
    for ($index = 2; $index <= $n; $index++) {
        $f *= $index;
    }

    return $f;
}

echo factorial(10) . "\n";