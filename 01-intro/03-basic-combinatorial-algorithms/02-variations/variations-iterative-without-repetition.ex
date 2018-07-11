defmodule VariationLinearWithoutRepetition do
  def pow(base, p), do: :math.pow(base, p) |> round()

  def compute_slot(index, slot_index, elements_count) do
    index |> div(pow(elements_count, slot_index)) |> rem(elements_count)
  end

  def iterate_slots(slot_index, _) when slot_index == -1, do: []

  def iterate_slots(slot_index, {index, elements_count, visited}) do
    slot = compute_slot(index, slot_index, elements_count)

    if slot in visited do
      throw(:break)
    end

    rest = {index, elements_count, visited ++ [slot]}
    [slot] ++ iterate_slots(slot_index - 1, rest)
  end

  def compute(elements, slots) do
    elements_count = Enum.count(elements)
    indexes = 0..(pow(elements_count, slots) - 1)

    for index <- indexes do
      try do
        iterate_slots(slots - 1, {index, elements_count, []})
      catch
        :break -> []
      end
      |> Enum.map(fn slot -> Enum.at(elements, slot) end)
    end
    |> Enum.filter(fn variation -> variation != [] end)
  end
end

IO.inspect(VariationLinearWithoutRepetition.compute(["a", "b", "c", "d"], 2))
