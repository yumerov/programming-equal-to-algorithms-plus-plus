defmodule Calculator do
  def factorial(0), do: 1
  def factorial(1), do: 1
  def factorial(n), do: n * factorial(n - 1)
end

IO.inspect(Calculator.factorial(10))
