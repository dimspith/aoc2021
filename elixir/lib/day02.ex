defmodule Day02 do
  def get_input(file) do
    File.read!(file)
    |> String.split("\n", trim: true)
  end

  def compute([op, val], {depth, distance}) do
    val = String.to_integer(val)

    case op do
      "forward" -> {depth, distance + val}
      "down" -> {depth + val, distance}
      "up" -> {depth - val, distance}
    end
  end

  def compute([op, val], {depth, distance, aim}) do
    val = String.to_integer(val)

    case op do
      "forward" -> {depth + aim * val, distance + val, aim}
      "down" -> {depth, distance, aim + val}
      "up" -> {depth, distance, aim - val}
    end
  end

  def part1 do
    get_input("priv/day02")
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> Enum.reduce({0, 0}, &compute/2)
    |> Tuple.product()
  end

  def part2 do
    get_input("priv/day02")
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> Enum.reduce({0, 0, 0}, &compute/2)
    |> (fn {depth, distance, _} -> depth * distance end).()
  end
end
