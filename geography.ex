defmodule Country do
  defstruct [:name, :language, :cities]
end

defmodule City do
  defstruct [:name, :population, :latitude, :longitude]
end

defmodule Geography do
  @moduledoc """
  Using files and structures.
  from *Études for Elixir*, O'Reilly Media, Inc., 2014.
  Copyright 2014 by J. David Eisenberg.
  """
  @vsn 0.1

  def make_geo_list(file_name) do
    {result, device}  = File.open(file_name, [:read, :utf8])
    process_line(device, [])
  end


  def process_line(device, geo_list) do
    data = IO.read(device, :line)
    case data do
      :eof  ->
        File.close(device)
        geo_list
      _     ->
        info = String.split(String.strip(data), ",")
        updated_list = process_info(info, geo_list)
        process_line(device, updated_list)
    end
  end

  defp process_info([country, language], geo_list) do
    [%Country{name: country, language: language, cities: []}
      | geo_list]
  end

  defp process_info([city, populn, lat, long], [hd|tail]) do
    new_cities = [%City{name: city, population: String.to_integer(populn),
    latitude: String.to_float(lat), longitude: String.to_float(long)} |
      hd.cities]
      [%Country{ hd | cities: new_cities} | tail]
  end

  @doc """
  Find the total population of all cities in the list
  that are in countries with a given primary language.
  """

  @spec total_population([Country], String.t) :: integer

  def total_population([head|tail], lang) do
    total_population(tail, lang, 0)
  end

  defp total_population([], lang, total) do
    total
  end

  defp total_population([head|tail], lang, total) do
    if head.language == lang do
      total_population(tail, lang, city_total(head.cities))
    else
      total_population(tail, lang, total)
    end
  end

  @spec city_total(list) :: number()

  defp city_total(cities) do
    Enum.reduce cities, 0, fn city, acc ->
      city.population + acc
    end
  end

end
