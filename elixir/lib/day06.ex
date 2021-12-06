defmodule Day06 do
  def get_input(file) do
    File.read!(file)
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def insert_missing_keys(map) do
    Enum.reduce(0..8, map, fn x, acc ->
      acc |> Map.put_new(x, 0)
    end)
  end

  def simulate(input, days) do
    input
    |> Enum.frequencies()
    |> insert_missing_keys
    |> (fn x ->
          Enum.reduce(1..days, x, fn _x, acc ->
            days = Map.keys(acc)
            fish = Map.values(acc)
            new_fish = hd(fish)

            fish
            |> tl
            |> Kernel.++([new_fish])
            |> List.update_at(6, &(&1 + new_fish))
            |> (fn x -> Enum.zip(days, x) end).()
            |> Map.new()
          end)
        end).()
  end

  def part1 do
    get_input("priv/day06")
    |> simulate(80)
    |> Map.values()
    |> Enum.sum()
  end

  def part2 do
    get_input("priv/day06")
    |> simulate(256)
    |> Map.values()
    |> Enum.sum()
  end
end
