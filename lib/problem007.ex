defmodule Eulixir.Problem007 do
  @moduledoc """
    http://projecteuler.net/problem=7
    By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
    that the 6th prime is 13.
    What is the 10 001st prime number?
  """

  @doc """
    iex> Eulixir.Problem007.solve(6)
    13
  """
  def solve(n) do
    primes = n
    |> nth_prime_upper_bound
    |> primes_to

    Enum.at(primes, length(primes) - n)
  end

  defp nth_prime_upper_bound(n) when n >= 6 do
    logn = :math.log(n)
    n * (logn + :math.log(logn))
    |> trunc
  end

  @doc """
    Returns primes upto limit using Eratosthenes sieve in reversed order.
    iex> Eulixir.Problem007.primes_to(10)
    [7, 5, 3, 2]
  """
  def primes_to(limit) do
    sieve([], initial_candidates(limit))
  end

  defp initial_candidates(limit) do
    2..limit |> Enum.into([])
  end

  defp sieve(primes, []), do: primes
  defp sieve(primes, [prime | candidates]) do
    sieve([prime | primes], reject_multiples(candidates, prime))
  end

  defp reject_multiples(numbers, factor) do
    Enum.reject(numbers, &(rem(&1, factor) == 0))
  end

  def solution do
    solve(10_001)
  end
end

