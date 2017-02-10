defmodule Eulixir.Problem005 do
  @moduledoc """
    http://projecteuler.net/problem=5
    2520 is the smallest number that can be divided by each of the numbers from
    1 to 10 without any remainder.
    What is the smallest positive number that is evenly divisible by all of the
    numbers from 1 to 20?
  """

  @doc """
    iex> Eulixir.Problem005.solve(10)
    2520
  """
  def solve(n) do
    1..n
    |> Enum.reduce(&lcm/2)
  end

  @doc """
    iex> Eulixir.Problem005.gcd(20, 25)
    5
  """
  def gcd(a, b) when b == 0, do: a
  def gcd(a, b), do: gcd(b, rem(a, b))

  @doc """
    iex> Eulixir.Problem005.lcm(20, 25)
    100
  """
  def lcm(a, b), do: div(a * b, gcd(a, b))

  def solution do
    solve(20)
  end
end

