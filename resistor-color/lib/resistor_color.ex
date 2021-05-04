defmodule ResistorColor do
  @moduledoc false

  @resistor_colors %{
    "black" => 0,
    "brown" => 1,
    "red" =>  2,
    "orange" => 3,
    "yellow" =>  4,
    "green" =>  5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9
  }

  @spec colors() :: list(String.t())
  def colors do
    @resistor_colors
    |> Map.to_list()
    |> Enum.sort(fn {_, a}, {_, b} -> a < b end)
    |> Enum.map(fn {name, _ } -> name end)
  end

  @spec code(String.t()) :: integer()
  def code(color) do
    @resistor_colors[color]
  end
end
