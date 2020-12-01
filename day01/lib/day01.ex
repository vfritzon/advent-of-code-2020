defmodule Day01 do
  def readInput(fileName) do
    String.split(File.read!(fileName)) |> Enum.map(fn n -> String.to_integer(n) end)
  end

  def part1(fileName) do
    input = readInput(fileName)

    combinations = for x <- input, y <- input, x != y, do: [x, y]

    [a,b] = Enum.find(combinations, fn c -> Enum.sum(c) == 2020 end)

    a*b
  end

  def part2(fileName) do 
    input = readInput(fileName)

    combinations = for x <- input, y <- input, z <- input, x != y && y !=z, do: [x, y, z]

    [a, b, c] = Enum.find(combinations, fn c -> Enum.sum(c) == 2020 end)

    a*b*c
  end
end
