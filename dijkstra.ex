defmodule Dijkstra do

  @moduledoc """
  Recursive function for calculating GCD of two numbers
  using Dijkstra's algorithm.
  """

  @vsn 0.1

  @doc """
  Calculates the greatest common divisor of two integers.
  Uses Dijkstra's algorithm, which does not requrires any division.
  """

  @spec gcd(number(), number()) :: number()

  def gcd(m, n) do
    cond do
      m == n  -> m
      m > n   -> gcd(m-n, n)
      m < n   -> gcd(m, n-m)
    end
  end
end
