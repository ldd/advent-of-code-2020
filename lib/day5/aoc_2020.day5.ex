defmodule AOC_2020.Day5 do
  defp getRow(s, ones, zeros) do
    s |> String.replace(ones, "1") |> String.replace(zeros, "0") |> String.to_integer(2)
  end

  defp getLocation(s) do
    {row, col} = s |> String.split_at(7)
    {row |> getRow("B", "F"), col |> getRow("R", "L")}
  end

  defp getIdList(s) do
    s
    |> Enum.filter(&(&1 != ""))
    |> Enum.map(&getLocation/1)
    |> Enum.map(fn {x, y} -> x * 8 + y end)
  end

  def part1(input) do
    input
    |> getIdList()
    |> Enum.max()
  end

  def part2(input) do
    id_list =
      input
      |> getIdList()
      |> Enum.sort()

    {_id, index} =
      id_list
      |> Enum.with_index(Enum.at(id_list, 0))
      |> Enum.find(nil, fn {x, i} -> x != i end)

    index
  end
end
