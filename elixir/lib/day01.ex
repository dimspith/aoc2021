defmodule Day01 do
  def get_input(file) do
    File.read!(file)
    |> String.split("\n", trim: true)
  end

  def part1 do
    input = get_input("priv/day01")

    input
    |> Enum.map(&String.to_integer/1)
    |> Enum.zip(tl(input))
    |> Enum.count(fn {v1, v2} -> v2 > v1 end)
  end

  def part2 do
    input = get_input("priv/day01")
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)

    input
    |> Enum.zip(tl(input))
    |> Enum.count(fn {v1, v2} -> v2 > v1 end)
  end
end
