defmodule Day1.Day1Part1 do
  @moduledoc false

  def part_1 do
    result =
      File.read!("input/day1.txt")
      |> String.split("\n")
      |> Enum.map(fn (string) ->
        String.split(string, " ") end)
      |> Enum.map(fn (list) ->
        Enum.filter(list, fn x ->
          String.length(x) > 0 end) end)
      |> Enum.map(fn (list) ->
        Enum.map(list, fn string ->
          Integer.parse(string) |> elem(0) end) end)

    IO.inspect(result)
    {:ok, 42}
  end
end
