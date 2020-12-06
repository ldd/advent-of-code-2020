defmodule AOC_2020Test do
  use ExUnit.Case
  doctest AOC_2020

  import Mix.Tasks.Aoc2020.GenerateAnswer, only: [get_raw_input: 2, runner: 1]

  @expected_results [
    {898_299, 143_933_922},
    {454, 649},
    {169, 7_560_370_818},
    {210, 131},
    {871, 640},
    {6387, 3039}
  ]
  @trimmed_days %{4 => true, 6 => true}

  @expected_results
  |> Enum.with_index()
  |> Enum.each(fn {{result1, result2}, raw_day} ->
    test "Day #{raw_day} passes" do
      day = unquote(raw_day) + 1
      trim = if Map.has_key?(@trimmed_days, day), do: "false", else: "true"
      raw_input = get_raw_input(day, trim)
      [part1, part2] = runner(day)
      assert part1.(raw_input) == unquote(result1)
      assert part2.(raw_input) == unquote(result2)
    end
  end)
end
