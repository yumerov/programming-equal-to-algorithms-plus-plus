defmodule VariationLinar do
  def pow(base, p), do: :math.pow(base, p) |> round()

  def compute_slot(index, slot_index, elements_count) do
    index |> div(pow(elements_count, slot_index)) |> rem(elements_count)
  end

  def compute(elements, slots) do
    elements_count = Enum.count(elements)
    indexes = 0..(pow(elements_count, slots) - 1)

    for index <- indexes do
      slot_range = (slots - 1)..0 |> Enum.to_list()

      for slot_index <- slot_range do
        slot = compute_slot(index, slot_index, elements_count)
        Enum.at(elements, slot)
      end
    end
  end
end

IO.inspect(VariationLinar.compute(["a", "b", "c", "d"], 3))
