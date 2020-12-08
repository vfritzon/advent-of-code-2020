defmodule Day08Test do
  use ExUnit.Case
  doctest Day08

  def readInput(fileName) do
    File.read!(fileName) |> String.trim() |> String.split("\n")
  end

  test "part1" do
    assert Day08.part1(readInput("exampleInput")) == {:loop, 5}
    assert Day08.part1(readInput("quizInput")) == {:loop, 1586}
  end

  test "part2" do
    assert Day08.part2(readInput("quizInput")) == {:terminate, 703}
  end
end
