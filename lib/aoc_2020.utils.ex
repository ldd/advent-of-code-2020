defmodule AOC_2020.Utils do
  def group_by_empty_line(l) do
    l
    |> Enum.chunk_by(&(&1 == ""))
    |> Enum.filter(&(&1 != [""]))
  end

  def parse(raw_input), do: raw_input |> Enum.map(&String.to_integer/1)
  def multiply(l), do: l |> Enum.reduce(&(&1 * &2))

  # for each entry, attempt to find @sum - entry in the dictionary
  def hasSum(l, dic, sum),
    do: Enum.filter(l, &Map.has_key?(dic, sum - &1))

  def valid_count(l, f), do: l |> Enum.filter(f) |> length
end
