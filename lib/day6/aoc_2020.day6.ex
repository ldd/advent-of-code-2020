defmodule AOC_2020.Day6 do
  defp helper(l) do
    l
    |> Enum.chunk_by(&(&1 == ""))
    |> Enum.filter(&(&1 != [""]))
    |> Enum.map(&{Enum.count(&1), Enum.join(&1) |> String.graphemes() |> Enum.frequencies()})
  end

  def part1(input) do
    input
    |> helper()
    |> Enum.map(&(Map.keys(elem(&1, 1)) |> Enum.count()))
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> helper()
    |> Enum.map(&{elem(&1, 0), Map.to_list(elem(&1, 1))})
    |> Enum.map(&(Enum.filter(elem(&1, 1), fn {_key, v} -> v == elem(&1, 0) end) |> Enum.count()))
    |> Enum.sum()
  end
end
