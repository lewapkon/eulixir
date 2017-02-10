defmodule Eulixir.Problem003 do
  @moduledoc """
    http://projecteuler.net/problem=3
    The prime factors of 13195 are 5, 7, 13 and 29.
    What is the largest prime factor of the number 600851475143 ?
  """

  @doc """
    iex> Eulixir.Problem003.solve(13_195)
    29
  """
  def solve(n) do
    n
    |> factorize
    |> List.first
  end

  @doc """
    iex> Eulixir.Problem003.factorize(13_195)
    [29, 13, 7, 5]
  """
  def factorize(n) do
    factorize(n, 2, [])
  end

  defp factorize(n, divisor, acc) when n < divisor, do: acc

  defp factorize(n, divisor, acc) when rem(n, divisor) == 0 do
    factorize(div(n, divisor), divisor, [divisor | acc])
  end

  defp factorize(n, divisor, acc) do
    factorize(n, divisor + 1, acc)
  end

  def solution do
    solve(600_851_475_143)
  end
end

