defmodule AdventOfCode2024Test do
  use ExUnit.Case
  doctest AdventOfCode2024

  test "greets the world" do
    assert AdventOfCode2024.hello() == :world
  end

  test "Day 1 part 1" do
    assert Day1.Day1Part1.part_1() == {:ok, 42}
  end
end
