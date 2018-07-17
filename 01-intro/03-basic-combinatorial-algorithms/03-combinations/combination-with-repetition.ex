defmodule Combination do
  def compute(elements, slots) do
    base = {elements, slots, Enum.count(elements)}
    extra = {1, 0, []}
    _compute(base, extra)
  end

  def _compute({_, slots, _}, {slot_index, _, _}) when slot_index > slots, do: nil

  def _compute({elements, slots, elements_count}, {slot_index, after_index, output}) do
    for next_slot_index <- after_index..(elements_count - 1) do
      append_to_output = Enum.at(elements, next_slot_index)
      not_nil = not is_nil(append_to_output)

      if not_nil do
        output = output ++ [append_to_output]

        if slot_index == slots do
          output |> IO.inspect()
        else
          base = {elements, slots, elements_count}
          extra = {slot_index + 1, next_slot_index, output}
          _compute(base, extra)
        end
      end
    end
  end
end

Combination.compute(["a", "b", "c", "d"], 2)
# Combination.compute(["a", "b", "c", "d", "e"], 3)
# IO.inspect(Combination.compute(["a", "b", "c", "d"], 2))
# IO.inspect(Combination.compute(["a", "b", "c", "d"], 2))
# IO.inspect(Combination.compute([0, 1, 2, 3, 4], 2))
# IO.inspect(Combination.compute([0, 1, 2], 3))
# IO.inspect(Combination.compute([0, 1, 2, 3, 4], 3))
# IO.inspect(Combination.compute(["a", "b", "c"], 3))
# Combination.compute(["a", "b", "c"], 2)
