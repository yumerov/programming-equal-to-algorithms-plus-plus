defmodule PermutationCalculator do
  @size 3

  def print_buffer(buffer) do
    buffer |> Map.values() |> Enum.map(fn x -> x + 1 end) |> IO.inspect()
  end

  def permutate(index, used, buffer) do
    if index >= @size do
      print_buffer(buffer)
    end

    0..(@size - 1)
    |> Enum.filter(fn subindex -> not Map.get(used, subindex) end)
    |> Enum.each(fn subindex ->
      permutate(index + 1, %{used | subindex => true}, %{buffer | index => subindex})
    end)
  end

  def permutate() do
    used = 0..(@size - 1) |> Enum.map(fn x -> {x, false} end) |> Map.new()
    buffer = 0..(@size - 1) |> Enum.map(fn x -> {x, nil} end) |> Map.new()
    permutate(0, used, buffer)
  end
end

PermutationCalculator.permutate()
