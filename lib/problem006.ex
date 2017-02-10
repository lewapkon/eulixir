defmodule Eulixir.Problem006 do
  @moduledoc """
    http://projecteuler.net/problem=6
    The sum of the squares of the first ten natural numbers is,
    1^2 + 2^2 + ... + 10^2 = 385
    The square of the sum of the first ten natural numbers is,
    (1 + 2 + ... + 10)^2 = 55^2 = 3025
    Hence the difference between the sum of the squares of the first ten natural
    numbers and the square of the sum is 3025 − 385 = 2640.
    Find the difference between the sum of the squares of the first one hundred
    natural numbers and the square of the sum.
  """

  @doc """
    iex> Eulixir.Problem006.solve(10)
    2640
  """
  def solve(n) do
    square_of_sum(n) - sum_of_squares(n)
  end

  @doc """
    Returns sum of squares from 1 to n.
    iex> Eulixir.Problem006.sum_of_squares(10)
    385
  """
  def sum_of_squares(n), do: div(n * (n + 1) * (2 * n + 1), 6)

  @doc """
    Returns square of sum of numbers from 1 to n.
    iex > Eulixir.Problem006.square_of_sum(10)
    55
  """
  def square_of_sum(n) do
    sum = div(n * (n + 1), 2)
    sum * sum
  end

  def solution do
    solve(20)
  end
end

