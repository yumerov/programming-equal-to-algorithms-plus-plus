defmodule SumCombinations do
  def compute(n), do: compute(n, 1)

  def compute(n, pos), do: compute(n, pos, %{0 => n + 1})

  def compute(n, pos, buffer) do
    if n == 0 do
      print_buffer(buffer)
    else
      for k <- n..1 do
        buffer = Map.merge(buffer, %{pos => k})

        if(buffer[pos] <= buffer[pos - 1]) do
          compute(n - k, pos + 1, buffer)
        end
      end
    end
  end

  def print_buffer(buffer) do
    [head | tail] = Map.values(buffer)
    IO.inspect(%{(head - 1) => tail}, label: "combination")
  end
end

for i <- 0..6, do: SumCombinations.compute(i)
