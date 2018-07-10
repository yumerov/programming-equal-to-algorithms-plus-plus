<?php

class PermutationCalculator
{
    protected $size = 3;
    protected $used = [];
    protected $buffer = [];

    public function __construct(int $size = 3)
    {
        $this->size = $size;
        $this->reset();
    }

    public function reset()
    {
        for ($index = 0; $index < $this->size; $index++)
        {
            $this->used[$index] = false;
        }
    }

    public function print_buffer()
    {
        foreach ($this->buffer as $key => $value)
        {
            echo ($value + 1) . " ";
        }
        echo "\n";
    }

    public function permutate(int $index = 0)
    {
        if ($index >= $this->size) {
            $this->print_buffer();
            return;
        }

        for ($i = 0; $i < $this->size; $i++)
        {
            if (!$this->used[$i]) {
                $this->used[$i] = true;
                $this->buffer[$index] = $i;
                $this->permutate($index + 1);
                $this->used[$i] = false;
            }
        }
    }
}

echo (new PermutationCalculator)->permutate();