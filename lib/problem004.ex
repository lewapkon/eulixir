defmodule Eulixir.Problem004 do
  @moduledoc """
    http://projecteuler.net/problem=4
    A palindromic number reads the same both ways. The largest palindrome made
    from the product of two 2-digit numbers is 9009 = 91 × 99.
    Find the largest palindrome made from the product of two 3-digit numbers.
  """

  @doc """
    iex> Eulixir.Problem004.solve(2)
    9009
  """
  def solve(number_of_digits) do
    upper_limit = pow10(number_of_digits) - 1

    pow10(number_of_digits - 1)..upper_limit
    |> Enum.flat_map(fn i ->
      i..upper_limit |> Enum.map(fn j -> {i, j} end)
    end)
    |> Enum.map(fn {x, y} -> x * y end)
    |> Enum.filter(&palindrome?/1)
    |> Enum.max
  end

  @doc """
    iex> Eulixir.Problem004.pow10(3)
    1000
  """
  def pow10(n) when n >= 0, do: pow10(n, 1)
  defp pow10(0, acc), do: acc
  defp pow10(n, acc), do: pow10(n - 1, acc * 10)

  @doc """
    iex> Eulixir.Problem004.palindrome?(9009)
    true
  """
  def palindrome?(n) do
    digits = n |> Integer.digits
    Enum.reverse(digits) == digits
  end

  def solution do
    solve(3)
  end
end

