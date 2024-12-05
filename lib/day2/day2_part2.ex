defmodule Day2.Day2Part2 do
  @moduledoc false

  def part_2 do
    result =
      File.read!("input/day2.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, " "))
      |> Enum.map(fn list -> Enum.map(list, fn x -> Integer.parse(x) |> elem(0) end) end)
      |> Enum.filter(fn list -> check_sorted?(list) end)
      |> str_len(0)

    {:ok, result}
  end

  defp check_sorted?(list) do
    is_sorted?(list, 0) or is_sorted?(Enum.reverse(list), 0)
  end

  defp is_sorted?([], _), do: true
  defp is_sorted?([_], _), do: true

  defp is_sorted?([h1, h2 | tail], acc) when h1 <= h2 do
    if not_distant?(h1, h2) do
      is_sorted?([h2 | tail], acc)
    else
      if acc == 1 do
        false
      else
        is_sorted?([h1 | tail], acc + 1)
      end
    end
  end

  defp is_sorted?([h1, h2 | _], acc) when h1 > h2 and acc > 0, do: false
  defp is_sorted?([h1, h2 | tail], acc) when h1 > h2 and acc == 0, do: is_sorted?([h2 | tail], acc + 1)

  defp not_distant?(n1, n2) do
    diference = n2 - n1

    if diference >= 1 and diference <= 3 do
      true
    else
      false
    end
  end

  defp str_len([_head | tail], acc) do
    str_len(tail, acc + 1)
  end

  defp str_len([], acc), do: acc
end
