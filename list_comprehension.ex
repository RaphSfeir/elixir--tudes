defmodule ListComprehension do

  @doc """
  Data set
  """

  @spec people_data() :: list(tuple())

  defp people_data do
    [{"Federico", "M", 22}, {"Kim", "F", 45}, {"Hansa", "F", 30},
    {"Tran", "M", 47}, {"Cathy", "F", 32}, {"Elias", "M", 50}]
  end

  @doc """
  Gets all males of the data set that are over 40
  """

  @spec get_males_over_40() :: list(tuple())

  def get_males_over_40 do
    for {name, gender, age} <- people_data(), gender == "M", age >= 40 do
      {name, gender, age}
    end
  end
end
