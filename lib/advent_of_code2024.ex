defmodule AdventOfCode2024 do
  @moduledoc """
  Documentation for `AdventOfCode2024`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AdventOfCode2024.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  Main function to call all other AOC functions
  """
  def main do
    IO.puts("This is my Elixir Advent of code 2024 solutions.")

    IO.puts("Day 1\n*---------------*")
    IO.puts("Part 1:")
    {:ok, d1p1} = Day1.Day1Part1.part_1()
    IO.puts("Answer: #{d1p1}")
    IO.puts("Part 2:")
    {:ok, d1p2} = Day1.Day1Part2.part2()
    IO.puts("Answer: #{d1p2}")

    :ok
  end
end
