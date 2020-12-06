defmodule AOC_2020.Day6 do
  import AOC_2020.Utils

  defp get_count_frequency(l) do
    l
    |> group_by_empty_line()
    |> Enum.map(
      &(Enum.join(&1)
        |> String.graphemes()
        |> Enum.frequencies()
        |> Enum.map(fn {_k, v} -> v == Enum.count(&1) end))
    )
  end

  def part1(input) do
    input
    |> get_count_frequency()
    |> Enum.map(&Enum.count(&1))
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> get_count_frequency()
    |> Enum.map(&Enum.count(&1, fn x -> x end))
    |> Enum.sum()
  end
end
