<?php

throw new Exception("Not working");


class OnlyZero
{
    protected $elements = [];
    protected $elementsCount = 0;
    protected $base = 2;

    public function __construct(array $elements)
    {
        $this->elements = $elements;
        $this->elementsCount = count($elements);
    }

    protected function computeSlot($index, $slotIndex)
    {
        $head = ($this->elementsCount ** $slotIndex);
        $sign = (-1) ** (floor($index / $head) % $this->elementsCount);
        return ($sign * $this->elements[$slotIndex]);
    }

    protected function formatVariation(array $variation)
    {
        $output = "";

        foreach ($variation as $element) {
            if ($element > 0) {
                $output .= " +";
            }
            $output .= $element;
        }

        $output .= " = 0";

        return $output;
    }

    public function compute()
    {
        $validVariations = [];
        foreach (range(0, ($this->base ** $this->elementsCount) - 1) as $index) {
            $slotRange = range(0, $this->elementsCount - 1);
            $elements = [];
            foreach ($slotRange as $slotIndex) {
                $elements[] = $this->computeSlot($index, $slotIndex);
            }

            if (array_sum($elements) == 0) {
                $validVariations[] = $elements;
            }
        }

        return array_map([$this, 'formatVariation'], $validVariations);
    }
}

print_r((new OnlyZero([1, 2, 3, 4, 5, 6, 7, 8]))->compute());