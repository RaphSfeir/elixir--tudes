defmodule Teeth do
  @moduledoc """
  Manipulate a list of lists representing tooth pocket depths.

  """
  @vsn 0.1

  @doc "Convenience function for providing a list of lists."
  @spec pocket_depths() :: list(list())

  def pocket_depths do
    [[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
    [3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
    [3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
    [3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
    [1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
    [3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
    [3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
    [1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
    [3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
    [3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
    [3,2,3,2,3,2]]
  end

  @doc """
   Takes a list of 32 lists of six numbers as its input.
   If a tooth isn’t present, it is represented by the list [0]
   instead of a list of six numbers. The function produces a
   list of the tooth numbers that require attention.
  """

  @spec alert(list(list())) :: list()

  def alert(depths) do
    alert(depths, 1, [])
  end

  def alert([], _tooth_number, result) do
    result |> Enum.reverse
  end

  def alert([tooth_depths | other_teeths], teeth_count, result) do
    cond do
      Stats.maximum(tooth_depths) >= 4 ->
        alert(other_teeths, teeth_count + 1, [teeth_count|result])
      true ->
        alert(other_teeths, teeth_count + 1, result)
    end
  end
end
