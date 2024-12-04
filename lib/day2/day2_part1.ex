defmodule Day2.Day2Part1 do
  @moduledoc false

  def part_1 do
    result =
      File.read!("input/day2.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, " "))
      |> Enum.map(fn list -> Enum.map(list, fn x -> Integer.parse(x) end) end)
      |> Enum.filter(fn list -> check_sorted?(list) end)
      |> Enum.filter(fn list -> check_distance_validation?(list) end)
      |> str_len(0)

    {:ok, result}
  end

  defp check_sorted?(list) do
    is_sorted?(list) or is_sorted?(Enum.reverse(list))
  end

  defp is_sorted?([]), do: true
  defp is_sorted?([_]), do: true
  defp is_sorted?([h1, h2 | tail]) when elem(h1, 0) <= elem(h2, 0), do: is_sorted?([h2 | tail])
  defp is_sorted?([h1, h2 | _]) when elem(h1, 0) > elem(h2, 0), do: false

  defp check_distance_validation?(list) do
    check_distance?(list) or check_distance?(Enum.reverse(list))
  end

  defp check_distance?([]), do: true
  defp check_distance?([_]), do: true
  defp check_distance?([head, neck | tail]) do
    difference = elem(neck, 0) - elem(head, 0)

    if difference >= 1 and difference <= 3 do
      check_distance?([neck | tail])
    else
      false
    end
  end
  defp check_distance?(_), do: false

  defp str_len([_head | tail], acc) do
    str_len(tail, acc + 1)
  end

  defp str_len([], acc), do: acc
end
