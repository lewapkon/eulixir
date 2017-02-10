defmodule Eulixir.Problem001 do
  @moduledoc """
    http://projecteuler.net/problem=1
    If we list all the natural numbers below 10 that are multiples of 3 or 5,
    we get 3, 5, 6 and 9. The sum of these multiples is 23.
    Find the sum of all the multiples of 3 or 5 below 1000.
  """

  @doc """
    iex> Eulixir.Problem001.solve(10)
    23
  """
  def solve(limit) do
    1..(limit - 1)
    |> Enum.filter(fn n -> rem(n, 3) == 0 or rem(n, 5) == 0 end)
    |> Enum.sum
  end

  def solution do
    solve(1_000)
  end
end

