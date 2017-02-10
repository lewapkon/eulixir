defmodule Eulixir.Problem003 do
  @moduledoc """
    http://projecteuler.net/problem=3
    The prime factors of 13195 are 5, 7, 13 and 29.
    What is the largest prime factor of the number 600851475143 ?
  """

  @doc """
    ## Examples
    iex> Eulixir.Problem003.solve(13_195)
    29
  """
  def solve(n) do
    n
    |> biggest_factor
  end

  defp biggest_factor(n) do
    biggest_factor(n, 2, 1)
  end

  defp biggest_factor(n, divisor, acc) when n < divisor, do: acc

  defp biggest_factor(n, divisor, _acc) when rem(n, divisor) == 0 do
    biggest_factor(div(n, divisor), divisor, n)
  end

  defp biggest_factor(n, divisor, acc) do
    biggest_factor(n, divisor + 1, acc)
  end

  def solution do
    solve(600_851_475_143)
  end
end

