defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3]
  @moduledoc """

  """

  @vsn 0.1

  @doc """
  Calculate the nth root of x using the Newton-Raphson method.
  """

  @spec nth_root(number(), number()) :: number()

  def nth_root(x, n) do
    nth_root(x, n, x / 2.0)
  end

  # Helper function; given estimate for x^n,
  # recursively calculates next estimated root as
  # estimate - (estimate^n - x) / (n * estimate^(n-1))
  # until the next estimate is within a limit of previous estimate.

  defp nth_root(x, n, estimate) do
    IO.puts("Current guess is #{estimate}")
    f       = raise(estimate, n) - x
    f_prime = n * raise(estimate, n-1)

    next    = estimate - f / f_prime
    change  = abs(estimate - next)

    cond do
      change < 1.0e-8 -> next
      true -> nth_root(x, n , next)
    end
  end



  @doc """
  Raise a number x to an integer power n.
  Any number to the power 0 equals 1.
  Any number to the power 1 is that number itself.
  When n is positive, x^n is equal to x times x^(n - 1)
  When n is negative, x^n is equal to 1.0 / x^n
  """

  @spec raise(number(), number()) :: number()

  def raise(_, 0) do
    1
  end

  def raise(x, n) when n < 0 do
    1.0 / raise(x, -n)
  end

  def raise(x, n) when n > 0 do
    raise(x, n, 1)
  end

  @spec raise(number(), number(), number()) :: number()

  defp raise(_x,0,acc) do
    acc
  end

  defp raise(x,n,acc) do
    raise(x,n-1, x * acc)
  end


end