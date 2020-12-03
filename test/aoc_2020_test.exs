defmodule AOC_2020Test do
  use ExUnit.Case
  doctest AOC_2020

  import Mix.Tasks.Aoc2020.GenerateAnswer, only: [get_raw_input: 1, runner: 1]

  @expected_results [{898_299, 143_933_922}, {454, 649}, {169, 7_560_370_818}]

  @expected_results
  |> Enum.with_index()
  |> Enum.each(fn {{result1, result2}, day} ->
    test "Day #{day} passes" do
      raw_input = get_raw_input(unquote(day) + 1)
      [part1, part2] = runner(unquote(day) + 1)
      assert part1.(raw_input) == unquote(result1)
      assert part2.(raw_input) == unquote(result2)
    end
  end)
end
