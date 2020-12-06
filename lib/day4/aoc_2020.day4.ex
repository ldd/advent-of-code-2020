defmodule AOC_2020.Day4 do
  import AOC_2020.Utils

  def parse_input(l) do
    l
    |> group_by_empty_line()
    |> Enum.map(fn x ->
      x
      |> Enum.join(" ")
      |> String.split()
      |> Enum.filter(&(!String.contains?(&1, "cid")))
    end)
    |> Enum.filter(&(length(&1) == 7))
  end

  def part1(input) do
    parse_input(input)
    |> Enum.count()
  end

  def part2(input) do
    parse_input(input)
    |> Enum.map(&Enum.sort/1)
    |> Enum.map(fn
      [
        "byr:" <> byr,
        "ecl:" <> ecl,
        "eyr:" <> eyr,
        "hcl:" <> hcl,
        "hgt:" <> hgt,
        "iyr:" <> iyr,
        "pid:" <> pid
      ] ->
        [birth_year, expiration_year, i_year] = [byr, eyr, iyr] |> parse()

        acceptable_height? =
          case hgt do
            <<head::binary-size(3), "cm">> ->
              String.to_integer(head) >= 150 and String.to_integer(head) <= 193

            <<head::binary-size(2), "in">> ->
              String.to_integer(head) >= 59 and String.to_integer(head) <= 76

            _ ->
              false
          end

        acceptable_color? =
          case hcl do
            "#" <> hair_color ->
              case Integer.parse(hair_color, 16) do
                {_, ""} -> String.length(hair_color) == 6
                _ -> false
              end

            _ ->
              false
          end

        acceptable_eye_color? =
          ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"] |> Enum.member?(ecl)

        #  fix: this allows non-integer pids, so it is more permissible than desired
        acceptable_pid? = String.length(pid) == 9

        expiration_year <= 2030 and expiration_year >= 2020 and
          birth_year <= 2002 and birth_year >= 1920 and
          i_year <= 2020 and i_year >= 2010 and
          acceptable_height? and
          acceptable_color? and
          acceptable_eye_color? and
          acceptable_pid?

      _ ->
        false
    end)
    |> Enum.count(& &1)
  end
end
