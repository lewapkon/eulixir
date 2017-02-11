defmodule Eulixir.Problem009 do
  @moduledoc """
    http://projecteuler.net/problem=9
    A Pythagorean triplet is a set of three natural numbers, a < b < c,
    for which, a^2 + b^2 = c^2.
    For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
    There exists exactly one Pythagorean triplet for which a + b + c = 1000.
    Find the product abc.
  """

  @doc """
    Let's assume:
    a = n^2 - m^2
    b = 2 * m * n
    For n, m > 0
    Then as c^2 = a^2 + b^2:
    c = n^2 + m^2
    Therefore m = sum / (2 * n) - n

    iex> Eulixir.Problem009.solve(30)
    780
  """
  def solve(sum) do
    n = 1..sum
    |> Enum.find(fn n ->
      m = m(sum, n)
      rem(sum, 2 * n) == 0 and 0 < m and m < n
    end)
    m = m(sum, n)

    a = n*n - m*m
    b = 2*n*m
    c = n*n + m*m

    a*b*c
  end

  defp m(sum, n), do: div(sum, 2 * n) - n

  def solution do
    solve(1000)
  end
end

