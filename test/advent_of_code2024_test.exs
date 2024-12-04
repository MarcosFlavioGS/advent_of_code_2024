defmodule AdventOfCode2024Test do
  use ExUnit.Case
  doctest AdventOfCode2024

  test "greets the world" do
    assert AdventOfCode2024.hello() == :world
  end

  test "Main" do
    assert AdventOfCode2024.main() == :ok
  end

  test "Day 1 part 1" do
    assert Day1.Day1Part1.part_1() == {:ok, 2066446}
  end

  test "Day 1 part 2" do
    assert Day1.Day1Part2.part_2() == {:ok, 24931009}
  end

  test "Day 2 part 1" do
    assert Day2.Day2Part1.part_1() == {:ok, 463}
  end
end
