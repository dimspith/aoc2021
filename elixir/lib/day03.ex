defmodule Day03 do
  def get_input(file) do
    File.read!(file)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(fn x -> Enum.map(x, &String.to_integer/1) end)
  end

  def get_bit(list, f) do
    ones = Enum.sum(list)
    if f.(ones, Enum.count(list) / 2), do: 1, else: 0
  end

  def find_bits(lists, f) do
    lists
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(fn list -> get_bit(list, f) end)
    |> List.flatten()
  end

  def filter_bits(lists, f) do
    Enum.reduce_while(0..Enum.count(Enum.at(lists, 1)), lists, fn i, acc ->
      bit = find_bits(acc, f) |> Enum.at(i)
      new_lines = Enum.filter(acc, fn x -> Enum.at(x, i) == bit end)
      if Enum.count(new_lines) == 1, do: {:halt, Enum.at(new_lines, 0)}, else: {:cont, new_lines}
    end)
  end

  def part1 do
    most_common = get_input("priv/day03") |> find_bits(&(&1 >= &2))
    least_common = Enum.map(most_common, &(Bitwise.bnot(&1) + 2))
    Integer.undigits(most_common, 2) * Integer.undigits(least_common, 2)
  end

  def part2 do
    lists = get_input("priv/day03")
    co2 = filter_bits(lists, &(&1 >= &2))
    oxygen = filter_bits(lists, &(&1 < &2))
    Integer.undigits(co2, 2) * Integer.undigits(oxygen, 2)
  end
end
