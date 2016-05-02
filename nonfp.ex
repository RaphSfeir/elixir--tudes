defmodule NonFP do

  @moduledoc """
  Use non-functional-programming constructs to create
  a list of lists with random entries.

  from *Études for Elixir*, O'Reilly Media, Inc., 2013.
  Copyright 2013 by J. David Eisenberg.
  """
  @vsn 0.1

  @doc """
  Generate a list of list representing pocket depths for a set of teeth.
  The first argument is a character list consisting of T and F for teeth
  that are present or absent. The second argument is the probability that
  any given tooth will be good.
  """

  @spec generate_pockets(list, number) :: list(list())

  def generate_pockets(teeth_presence, chance) do
    :random.seed(:erlang.now())
    generate_pockets(teeth_presence, chance, [])
  end

  # When the tooth list is empty, return the final list of lists
  # If a tooth is present, generate a set of six depths and add it
  # to the result; otherwise add a [0] to the result.
  def generate_pockets([], _, result) do
    result |> Enum.reverse
  end

  def generate_pockets([h|tail], chance, result) do
    cond do
      h == ?T  -> generate_pockets(tail, chance, [generate_tooth(chance) | result])
      h == ?F  -> generate_pockets(tail, chance, [[0] | result])
    end
  end


  @doc """
  Generate a tooth with a given chance of being a tooth with problems.
  """
  def generate_tooth(chance) do
    r = :random.uniform()
    base_depth = cond do
      r < chance -> 3
      true       -> 2
    end

    generate_tooth(base_depth, 6, [])
  end

  defp generate_tooth(_base_depth, 0, result_depths) do
    result_depths
  end

  defp generate_tooth(base_depth, items_left, result_depths) do
    delta = :random.uniform(3) - 2 #-1, 0 or 1
    generate_tooth(base_depth, items_left - 1, [delta + base_depth | result_depths])
  end

  def test_pockets() do
    tlist = 'FTTTTTTTTTTTTTTFTTTTTTTTTTTTTTTT'
    big_list = generate_pockets(tlist, 0.25)
    print_pockets(big_list)
  end

  def print_pockets([]), do: IO.puts("Finished.")

  def print_pockets([head | tail]) do
    IO.puts(inspect(head))
    print_pockets(tail)
  end
end
