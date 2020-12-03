defmodule AOC_2020.Day2 do
  defp parseMessage(s) do
    [rule, password] = s |> String.split(": ", trim: true)
    [range, letter] = rule |> String.split(" ")
    [low, high] = range |> String.split("-") |> Enum.map(&String.to_integer/1)
    [low, high, letter, password]
  end

  def part1_filter(s) do
    [low, high, letter, password] = parseMessage(s)

    dic = password |> String.graphemes() |> Enum.frequencies()
    v = Map.get(dic, letter, -1)
    v >= low and v <= high
  end

  def valid_count(l, f), do: l |> Enum.filter(f) |> length

  def part1(raw_input) do
    valid_count(raw_input, &part1_filter/1)
  end

  def part2_filter(s) do
    [low, high, letter, password] = parseMessage(s)

    letter_list = password |> String.graphemes()
    l = Enum.at(letter_list, low - 1) == letter
    h = Enum.at(letter_list, high - 1) == letter
    l != h
  end

  def part2(raw_input) do
    valid_count(raw_input, &part2_filter/1)
  end
end
