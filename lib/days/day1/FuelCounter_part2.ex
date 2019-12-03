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
    total =
      Stream.iterate(mass, &(div(&1, 3) - 2))
      |> Enum.reduce_while(0, fn x, acc ->
        if x > 0, do: {:cont, acc + x}, else: {:halt, acc}
      end)

    total - mass
  end
end
