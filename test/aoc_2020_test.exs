defmodule AOC_2020Test do
  use ExUnit.Case
  doctest AOC_2020

  test "Day 1 passes" do
    raw_input = Mix.Tasks.Aoc2020.GenerateAnswer.get_raw_input(1)
    assert AOC_2020.Day1.part1(raw_input) == 898_299
    assert AOC_2020.Day1.part2(raw_input) == 143_933_922
  end

  test "Day 2 passes" do
    raw_input = Mix.Tasks.Aoc2020.GenerateAnswer.get_raw_input(2)
    assert AOC_2020.Day2.part1(raw_input) == 454
    assert AOC_2020.Day2.part2(raw_input) == 649
  end
end
