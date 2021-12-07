defmodule Day07 do
  def get_input(file) do
    File.read!(file)
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def median(list), do: list |> Enum.sort() |> Enum.at(div(length(list), 2))
  def mean(list), do: Enum.sum(list) |> div(length(list))

  def part1 do
    with input <- get_input("priv/day07"),
         median <- median(input) do
      Stream.map(input, fn x -> abs(x - median) end) |> Enum.sum()
    end
  end

  def part2 do
    with input <- get_input("priv/day07"),
         mean <- mean(input) do
      Stream.map(input, fn x ->
        n = abs(x - mean)
        div((n*(n+1)), 2)
      end)
      |> Enum.sum()
    end
  end
end
