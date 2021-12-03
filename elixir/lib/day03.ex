defmodule Day03 do
  def get_input(file) do
    File.read!(file)
    |> String.split("\n", trim: true)
  end

  def str_to_ints(s) do
    s
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end

  def sort_freq(freq), do: Enum.sort_by(freq, fn {_, v} -> v end, :desc)

  def extract_bit(list) do
    freq =
      list
      |> Tuple.to_list()
      |> Enum.frequencies()
      |> sort_freq

    [{mc, _}, {lc, _}] = freq
    [mc, lc]
  end

  def find_bits(lists) do
    lists
    |> Enum.map(&str_to_ints/1)
    |> List.zip()
    |> Enum.map(&extract_bit/1)
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  def find_rating(x, lists) do
    IO.inspect(x)
    if length(lists) <= 1 do
      {:halt, List.flatten(lists)}
    else
      
      {:cont, Enum.filter(lists, fn v -> v == x end)}
    end
  end

  def life_support_rating([mc, lc], lists) do
    co2 = Enum.reduce_while(mc, lists, &find_rating(&1, &2))
    oxygen = Enum.reduce_while(lc, lists, &find_rating(&1, &2))
    IO.inspect(co2, oxygen)
    # Enum.product([co2, oxygen])
  end

  def part1 do
    get_input("priv/day03")
    |> find_bits
    |> Enum.map(&Integer.undigits(&1, 2))
    |> Enum.product()
  end

  def part2 do
    input = get_input("priv/day03")
    lists = input |> Enum.map(&str_to_ints/1)
    bits = input |> find_bits
    IO.inspect(bits)
    life_support_rating(bits, lists)
  end
end
