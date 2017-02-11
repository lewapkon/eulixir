defmodule Eulixir.Problem010 do
  @moduledoc """
    http://projecteuler.net/problem=10
    The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
    Find the sum of all the primes below two million.
  """

  @doc """
    iex> Eulixir.Problem010.solve(10)
    17
  """
  def solve(limit) do
    limit
    |> primes_to
    |> Enum.sum
  end

  @doc """
    Returns primes upto limit in reversed order.
    iex> Eulixir.Problem010.primes_to(10)
    [7, 5, 3, 2]
  """
  def primes_to(limit) do
    primes_to(limit, 2, [])
  end

  defp primes_to(limit, n, acc) when n > limit, do: acc
  defp primes_to(limit, n, acc) do
    if prime?(n) do
      primes_to(limit, n + 1, [n | acc])
    else
      primes_to(limit, n + 1, acc)
    end
  end

  @doc """
    Returns primes upto limit in reversed order.
    iex> Eulixir.Problem010.prime?(982_451_653)
    true
    iex> Eulixir.Problem010.prime?(982_451_654)
    false
  """
  def prime?(2), do: true
  def prime?(3), do: true
  def prime?(n) when rem(n, 2) == 0, do: false
  def prime?(prime_candidate) do
    max_divisor = max(2, trunc(:math.sqrt(prime_candidate)))
    prime?(prime_candidate, 3, max_divisor)
  end

  defp prime?(_prime_candidate, current_divisor, max_divisor)
    when current_divisor > max_divisor, do: true

  defp prime?(prime_candidate, current_divisor, _max_divisor)
    when rem(prime_candidate, current_divisor) == 0, do: false

  defp prime?(prime_candidate, current_divisor, max_divisor) do
    prime?(prime_candidate, current_divisor + 2, max_divisor)
  end

  def solution do
    solve(2_000_000)
  end
end

