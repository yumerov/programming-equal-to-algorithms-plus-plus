defmodule OnlyZero do
  def extract(data, 1), do: data

  def extract([left, right], depth), do: extract(left, depth - 1) ++ extract(right, depth - 1)

  def compute([], prefix), do: prefix

  def compute(tail, head) do
    [h | t] = tail

    [compute(t, head ++ [h])] ++ [compute(t, head ++ [-h])]
  end

  def compute(elements) do
    [head | tail] = elements

    ([compute(tail, [head])] ++ [compute(tail, [-head])])
    |> extract(Enum.count(elements))
    |> Enum.filter(fn row -> Enum.sum(row) == 0 end)
  end
end

# IO.inspect(OnlyZero.compute([1, 2, 3]))
IO.inspect(OnlyZero.compute([1, 2, 3, 4, 5, 6, 7, 8]))
