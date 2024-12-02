defmodule Day1.Day1Part1 do
  @moduledoc """
    This is the part 1 solved.
  """

  def part_1 do
    result =
      File.read!("input/day1.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, " "))
      |> Enum.map(fn (list) ->
        Enum.filter(list, fn x ->
          String.length(x) > 0 end) end)
      |> Enum.map(fn (list) ->
        Enum.map(list, fn string ->
          Integer.parse(string) |> elem(0) end) end)
      |> select([], [])
      |> sorter()
      |> compare([])

    final = Enum.reduce(result, fn x, acc -> x + acc end)
    {:ok, final}
  end

  # Util functions

  defp select([], acc1, acc2), do: {acc1, acc2}

  defp select([[elem1, elem2] | tail], acc1, acc2) do
    select(tail, [elem1 | acc1], [elem2 | acc2])
  end

  defp sorter({first, second}) do
    fst = Enum.sort(first)
    snd = Enum.sort(second)

    {fst, snd}
  end

  defp compare({[head1 | tail1], [head2 | tail2]}, acc) when head1 < head2 do
      compare({tail1, tail2}, [head2 - head1 | acc])
  end

  defp compare({[head1 | tail1], [head2 | tail2]}, acc) when head1 >= head2 do
    compare({tail1, tail2}, [head1 - head2 | acc])
  end

  defp compare({[], []}, acc), do: acc
end
