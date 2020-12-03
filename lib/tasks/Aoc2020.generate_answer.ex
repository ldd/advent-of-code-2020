defmodule Mix.Tasks.Aoc2020.GenerateAnswer do
  use Mix.Task

  def get_raw_input(day) do
    case File.read("input/day#{day}.txt") do
      {:ok, rawInput} ->
        rawInput |> String.split("\n", trim: true)

      _ ->
        []
    end
  end

  def runner(day) do
    module = Module.concat(AOC_2020, "Elixir.Day#{day}")
    [&module.part1/1, &module.part2/1]
  end

  def run(day) do
    [f, g] = runner(day)
    input = get_raw_input(day)
    result = [f.(input), g.(input)]
    IO.inspect(result)
  end
end
