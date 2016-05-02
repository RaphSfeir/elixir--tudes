defmodule Dates do

  @moduledoc """
  """

  @vsn 0.1

  @doc """
  Takes a string in ISO date format and returns list of integers in form [yyyy, mm, dd]
  No error checking
  """

  @spec date_parts(list) :: list

  def date_parts(iso_date) do
    [y_str, m_str, d_str] = String.split(iso_date, ~r/-/)
    [:erlang.binary_to_integer(y_str), :erlang.binary_to_integer(m_str), :erlang.binary_to_integer(d_str)]
  end

  @doc """

  """

  @spec julian(list) :: integer()

  def julian(iso_date) do
    [y,m,d] = date_parts(iso_date)
    days_per_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    result = month_total(m, days_per_month, 0) + d
    result
  end

  @spec month_total(number, [number], number) :: number

  # Helper function that recursively accumulates days
  # for all months up to (but not including) the current month

  defp month_total(1, _days_per_month, total) do
    total
  end

  defp month_total(month, [days_per_month_head|days_per_month_tail], accumulator) do
    month_total(month - 1, days_per_month_tail, accumulator + days_per_month_head)
  end
end
