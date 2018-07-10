<?php

function factorial(int $n): int 
{
    if (in_array($n, [0, 1])) {
        return 1;
    }

    return $n * factorial($n - 1);
}

echo factorial(10) . "\n";