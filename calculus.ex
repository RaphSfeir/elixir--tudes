defmodule Calculus do

  @doc """
  Calculates approximation of derivative of f at point x.
  """
  @spec derivative(function, number) :: number

  def derivative(function, x) do
    delta = 1.0e-10
    (function.(x + delta) - function.(x)) / delta
  end


end
