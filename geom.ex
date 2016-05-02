defmodule Geom do
  @moduledoc """
  Functions for calculating areas
  """
  @vsn 0.1
  @doc """
  Calculates the area of a shape, given the
  shape and two of the dimensions as a tuple.
  Returns the productof its arguments for a rectangle,
  one half the product of the arguments for a triangle, and
  :math.pi times the product of the arguments for
  an ellipse. Any invalid data returns zero.
  """


  @spec area_pmatching(atom(), number(), number()) :: number()

  def area_pmatching(shape, dim1, dim2) when dim1 >= 0 and dim2 >= 0 do
    case shape do
      :rectangle  -> dim1 * dim2
      :triangle   -> dim1 * dim2 / 2.0
      :ellipse    -> :math.pi() * dim1 * dim2
    end
  end

  @spec area({atom(), number(), number() }) :: number()

  def area({shape, dim1, dim2}) do
    area(shape, dim1, dim2)
  end

  # Individual functions to handle each shape

  @spec area(atom(), number(), number()) :: number()

  defp area(:rectangle, width, height) when width >= 0 and height >= 0 do
    width * height
  end

  defp area(:triangle, a, b) when a >= 0 and b >= 0  do
    a * b / 2.0
  end

  defp area(:ellipse, a, b) when a >= 0 and b >= 0 do
    :math.pi() * a * b
  end

  defp area(_, _, _) do
    0
  end

end
