<?php

class VariationLinear
{
    protected $elements;
    protected $elementsCount;
    protected $slotCount;

    public function __construct(array $elements, int $slots)
    {
        $this->elements = $elements;
        $this->elementsCount = count($elements);
        $this->slotCount = $slots;
    }

    protected function computeSlot(int $index, int $slot)
    {
        return (floor($index / ($this->elementsCount ** $slot)) % $this->elementsCount);
    }

    public function compute()
    {
        $variations = range(0, ($this->elementsCount ** $this->slotCount) - 1);
        foreach ($variations as $index) {
            $slots = range($this->slotCount - 1, 0);
            $elements = [];
            foreach ($slots as $slot) {
                $elements[] = $this->elements[$this->computeSlot($index, $slot)];
            }
            echo implode(", ", $elements) . "\n";
        }
        
    }
}

echo (new VariationLinear(["a", "b", "c", "d", "e"], 3))->compute();