defmodule Day1.Day1Part2 do
  @moduledoc """
    Rolved day1 part 2. In this part I did some recursion to get the similarities :)

    The check_similarity functions are 4 functions that iterate recursively both through the first list
    one by one and checking the second list for the occurrence of the numbers at the same time.

    There are 4 funcions for this with the arities:

    check_similarity/2 and check_similarity/3

    the first two functions iterate through the first columm and the last two functions iterate through the second collum.

  """

  def part2 do
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
      |> check_similarity(0)

    {:ok, result}
  end

  defp select([], acc1, acc2), do: {acc1, acc2}

  defp select([[elem1, elem2] | tail], acc1, acc2) do
    select(tail, [elem1 | acc1], [elem2 | acc2])
  end

  # Similarity checker functions

  defp check_similarity({[head | tail], snd}, score) do
    check_similarity({tail, snd}, score + check_similarity(head, snd, 0))
  end

  defp check_similarity({[], _snd}, score), do: score

  defp check_similarity(fst, [head | tail], score) do
    if fst == head do
      check_similarity(fst, tail, score + 1)
    else
      check_similarity(fst, tail, score)
    end
  end

  defp check_similarity(fst, [], score), do: fst * score
end
