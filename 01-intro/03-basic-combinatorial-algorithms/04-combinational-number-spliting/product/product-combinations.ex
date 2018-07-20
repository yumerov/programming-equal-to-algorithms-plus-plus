defmodule SumCombinations do
  def compute(0), do: []
  def compute(1), do: [1]
  def compute(n), do: compute(n, 1)

  def compute(n, pos), do: compute(n, pos, %{0 => n + 1})

  def compute(n, pos, buffer) do
    if n == 1 do
      print_buffer(buffer)
    else
      for k <- n..2 do
        buffer = Map.merge(buffer, %{pos => k})

        if buffer[pos] <= buffer[pos - 1] and rem(n, k) == 0 do
          compute(Integer.floor_div(n, k), pos + 1, buffer)
        end
      end
    end
  end

  def print_buffer(buffer) do
    [head | tail] = Map.values(buffer)
    IO.inspect(%{(head - 1) => "[" <> Enum.join(tail, ", ") <> "]"}, label: "combination")
  end
end

for i <- 2..20, do: SumCombinations.compute(i)
