
defmodule City do
  defstruct name: "",  population: 0, latitude: 0.0, longitude: 0.0
end

defprotocol Valid do
  @doc "Returns true if data is considered valid"
  def valid?(data)
end

defimpl Valid, for: City do
  def valid?(%City{population: pop, latitude: lat, longitude: long}) do
    p > 0 &&
    lat >= -90 && lat <= -90 &&
    long >= -180 && long <= 180
  end
end
