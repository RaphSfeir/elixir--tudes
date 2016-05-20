defmodule Stats do

  @moduledoc """
  """

  @vsn 0.1


  @doc """
  Calculates the mean of a list of integers
  """

  @spec mean([number]) :: number

  def mean(numbers) do
    Enum.sum(numbers) / Enum.count(numbers)
  end

  @doc """
  Calculates the standard deviation of a list of numbers
  """

  @spec stdv([number]) :: number

  def stdv(numbers) do
     n = Enum.count(numbers)
     sum = List.foldl(numbers, 0, fn(x, acc) -> x + acc end)
     sum_of_squares = List.foldl(numbers, 0, fn(x, acc) -> x * x + acc end)

     #bonus points !
     {sum, sum_squares} = List.foldl(numbers, {0,0}, fn(x, acc_sum, acc_sum_squares) ->
       {x + acc_sum, x * x + acc_sum_squares} end)

     :math.sqrt(sum * sum - sum_of_squares * n / (n * (n - 1)))
  end

  @doc """

  """

  @spec minimum([number]) :: number()

  def minimum(list) do
    [head | tail] = list
    minimum(tail, head)
  end

  # When there are no more numbers, return the result.

  @spec minimum([number], number) :: number

  defp minimum([], candidate) do
    candidate
  end

  # If the current result is less than the first item in the list,
  # keep it as the result and recursively look at the remainder of the list.
  # Note that you can use a variable assigned as part of a cons in a guard.

  defp minimum([head|tail], candidate) when candidate < head do
    minimum(tail, candidate)
  end

  # Otherwise, the head of the list becomes the new minimum,
   # and recursively look at the remainder of the list.


  defp minimum([head|tail], _candidate) do
    minimum(tail, head)
  end


  @doc "Recursively find the maximum entry in a list of numbers."
  @spec maximum([number]) :: number

  def maximum(list) do
    [head | tail] = list
    maximum(tail, head)
  end

  # When there are no more numbers, return the result.

  @spec maximum([number], number) :: number

  defp maximum([], result) do
    result
  end

  # If the current result is greater than the first item in the list,
  # keep it as the result and recursively look at the remainder of the list.

  defp maximum([head | tail], result) when result > head do
    maximum(tail, result)
  end

  # Otherwise, the head of the list becomes the new maximum,
  # and recursively look at the remainder of the list.

  defp maximum([head | tail], _result) do
    maximum(tail, head)
  end

  # @doc "Find the range of a list of numbers as a list [min, max]."
  @spec range([number]) :: [number]

  def range(list) do
    [minimum(list), maximum(list)]
  end
end
