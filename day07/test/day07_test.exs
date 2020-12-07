defmodule Day07Test do
  use ExUnit.Case
  doctest Day07

  def readInput(fileName) do
    File.read!(fileName) |> String.trim() |> String.split("\n")
  end

  test "part1" do
    assert Day07.part1(readInput("exampleInput")) == 4
    assert Day07.part1(readInput("quizInput")) == 148
  end

  test "part2" do
    assert Day07.part2(readInput("exampleInput2")) == 126
    assert Day07.part2(readInput("exampleInput")) == 32
    assert Day07.part2(readInput("quizInput")) == 0
  end
end
