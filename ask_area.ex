defmodule AskArea do

  @moduledoc """
  """

  @vsn 0.1


  @doc """
  Requests a character for the name of a shape,
  numbers for its dimensions, and calculates shape's area.
  The characters are R for rectangle, T for triangle,
  and E for ellipse. Input is allowed in either upper
  or lower case. For unknown shapes, the first "dimension" will
  be the unknown character.
  """

  @spec area() :: number()

  def area() do
    input = IO.gets("R)ectangle, T)riangle or E)llipse ? ")
    shape = input |> String.first  |> char_to_shape
    {d1, d2} = case shape do
      :rectangle  -> get_dimensions("width","height")
      :triangle   -> get_dimensions("base", "height")
      :ellipse    -> get_dimensions("major radios", "minor radius")
      :unknown    -> {String.first(input), 0}
    end

    calculate(shape, d1, d2)
  end


  @doc """
  Given a character, returns an atom representing the
  specified shape (or the atom unknown if a bad character is given).
  """

  @spec char_to_shape(char()) :: atom()

  def char_to_shape(character) do
    case String.upcase(character) do
      "R" -> :rectangle
      "T" -> :triangle
      "E" -> :ellipse
      _ -> :unknown
    end
  end

  @doc """
  Present a prompt and get a number from the
  user. Allow integers only.
  """
  @spec get_number(String.t()) :: number()

  def get_number(prompt) do
    input = IO.gets("Enter #{prompt} > ")
    #:erlang.binary_to_integer(String.strip(input))
    input |> String.strip |> :erlang.binary_to_integer
  end

    @doc """
    Get dimensions for a shape. Input are the two prompts,
    output is a tuple {Dimension1, Dimension2}.
    """
    @spec get_dimensions(String.t(), String.t()) :: {number(), number()}

    def get_dimensions(prompt1, prompt2) do
      n1 = get_number(prompt1)
      n2 = get_number(prompt2)

      {n1, n2}
    end


    @doc """
    Takes a shape (atom) and two dimensions (numbers) in, and call the area function to calculate the area of the shape.
    """

    @spec calculate(atom(), number(), number()) :: number()

    def calculate(shape, n1, n2) do
      cond do
        shape == :unknown -> IO.puts("Unkown shape #{n1}")
        n1 < 0 or n2 < 0  -> IO.puts("Both numbers must be greater than zero dude")
        true              -> Geom.area({shape, n1, n2})
      end
    end

end
