defmodule Day06 do
  def part1(input) do
    count_group = fn group_answers ->
      group_answers
      |> String.split()
      |> Enum.flat_map(&String.split/1)
      |> Enum.flat_map(&String.graphemes/1)
      |> MapSet.new()
      |> Enum.count()
    end

    input
    |> Enum.map(count_group)
    |> Enum.sum()
  end

  def part2(input) do
    parse_group_answers = fn answers ->
      answers
      |> String.split
      |> Enum.map(&String.graphemes/1)
    end

    find_common_answers = fn group_answers ->
      group_answers
      |> Enum.map(&MapSet.new/1)
      |> Enum.reduce(fn x, acc -> MapSet.intersection(x, acc) end)
      |> Enum.count()
    end

    input
    |> Enum.map(parse_group_answers)
    |> Enum.map(find_common_answers)
    |> Enum.sum()
  end
end
