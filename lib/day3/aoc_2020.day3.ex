defmodule AOC_2020.Day3 do
  import AOC_2020.Utils

  def count_trees(input, slope, rows) do
    input
    |> Enum.with_index()
    |> Enum.map_every(rows, fn {r, i} ->
      location = rem(floor(i * slope), String.length(r))
      String.graphemes(r) |> Enum.at(location)
    end)
    |> valid_count(&(&1 == "#"))
  end

  def part1(input) do
    count_trees(input, 3, 1)
  end

  def part2(input) do
    [[1, 1], [3, 1], [5, 1], [7, 1], [0.5, 2]]
    |> Enum.map(fn [slope, r] -> count_trees(input, slope, r) end)
    |> multiply()
  end
end
