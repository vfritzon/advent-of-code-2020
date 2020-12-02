defmodule Day02 do
  def readInput(fileName) do
    String.split(File.read!(fileName), "\n")
  end

  def parseLine(line) do
    line
    |> Enum.map(fn l ->
      Regex.run(~r/^([[:digit:]]*)-([[:digit:]]*) (.): (.*)$/, l)
    end)
    |> Enum.filter(fn m -> m != nil end)
  end

  def part1(fileName) do
    parseLine(readInput(fileName))
    |> Enum.filter(&isValidPassword/1)
    |> Enum.count()
  end

  def isValidPassword([_, min, max, c, password]) do
    occurences = password |> String.graphemes() |> Enum.count(&(&1 == c))

    occurences >= String.to_integer(min) && occurences <= String.to_integer(max)
  end

  def part2(fileName) do
    parseLine(readInput(fileName))
    |> Enum.filter(&exactly_one_is/1)
    |> Enum.count()
  end

  def exactly_one_is([_, i, j, c, password]) do
    a = password |> String.graphemes() |> Enum.at(String.to_integer(i) - 1)
    b = password |> String.graphemes() |> Enum.at(String.to_integer(j) - 1)

    (a == c || b == c) && a != b
  end
end
