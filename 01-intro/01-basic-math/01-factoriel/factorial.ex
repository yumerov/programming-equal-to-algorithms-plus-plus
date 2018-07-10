defmodule Calculator do
  def factorial(0), do: 1
  def factorial(1), do: 1

  def factorial(n) do
    2..n
    |> Enum.reduce(1, fn index, f -> index * f end)
  end
end

IO.inspect(Calculator.factorial(10))
