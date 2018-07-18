defmodule Combination do
  def pow(base, p), do: :math.pow(base, p) |> round()

  def compute_combination(slot_index, _, _, {_, _, _}) when slot_index == -1 do
    []
  end

  def compute_combination(
        slot_index,
        combination_index,
        index_buffer,
        {elements, elements_count, slots}
      ) do
    index = combination_index |> div(pow(elements_count, slot_index)) |> rem(elements_count)
    prev_index = Enum.at(index_buffer, -1, -1)

    if prev_index != [] and prev_index >= index do
      raise "not valid"
    else
      head = [Enum.at(elements, index)]

      tail =
        compute_combination(
          slot_index - 1,
          combination_index,
          index_buffer ++ [index],
          {elements, elements_count, slots}
        )

      head ++ tail
    end
  end

  def compute(elements, slots) do
    elements_count = Enum.count(elements)
    indexes = 0..(pow(elements_count, slots) - 1)

    for combination_index <- indexes do
      try do
        compute_combination(slots - 1, combination_index, [], {elements, elements_count, slots})
      rescue
        RuntimeError -> []
      end
    end
    |> Enum.filter(fn combination -> not Enum.empty?(combination) end)
  end
end

# Combination.compute(["a", "b", "c", "d"], 2)
# Combination.compute(["a", "b", "c", "d", "e"], 3)
IO.inspect(Combination.compute(["a", "b", "c", "d"], 2))
# IO.inspect(Combination.compute(["a", "b", "c", "d"], 2))
# IO.inspect(Combination.compute([0, 1, 2, 3, 4], 2))
# IO.inspect(Combination.compute([0, 1, 2], 3))
# IO.inspect(Combination.compute([0, 1, 2, 3, 4], 3))
# IO.inspect(Combination.compute(["a", "b", "c"], 3))
# Combination.compute(["a", "b", "c"], 2)
