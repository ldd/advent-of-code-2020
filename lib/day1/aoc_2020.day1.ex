defmodule AOC_2020.Day1 do
  @sum 2020
  import AOC_2020.Utils

  def part1(raw_input) do
    input = parse(raw_input)
    # make a dictionary
    dic = input |> Enum.into(%{}, &{&1, true})

    case hasSum(input, dic, @sum) do
      [x, y] -> x * y
      _ -> nil
    end
  end

  def part2(raw_input) do
    input = parse(raw_input)
    # make a dictionary of simple sums
    dic =
      input
      |> Enum.reduce(%{}, fn value, acc ->
        Enum.into(input, acc, &{&1 + value, true})
      end)

    case hasSum(input, dic, @sum) do
      [x, y, z] -> x * y * z
      _ -> nil
    end
  end
end
