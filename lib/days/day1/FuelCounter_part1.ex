defmodule FuelCounter_part1 do
  def total_fuel do
    "lib/inputs/modules.txt"
    |> File.stream!()
    |> Stream.map(&convert_line_to_int/1)
    |> Enum.map(&fuel_per_module/1)
    |> Enum.sum()
    |> IO.puts()
  end

  def convert_line_to_int(line) do
    elem(Integer.parse(line), 0)
  end

  def fuel_per_module(mass) do
    div(mass, 3) - 2
  end
end
