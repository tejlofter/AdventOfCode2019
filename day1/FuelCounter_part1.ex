defmodule FuelCounter do
  def total_fuel do
    "modules.txt"
    |> File.stream!()
    |> Stream.map(&convert_line_to_int/1)
    |> Enum.map(&fuel_per_module/1)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
    |> IO.puts()
  end

  def convert_line_to_int(line) do
    elem(Integer.parse(line), 0)
  end

  def fuel_per_module(mass) do
    div(mass, 3) - 2
  end
end
