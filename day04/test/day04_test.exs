defmodule Day04Test do
  use ExUnit.Case
  doctest Day04

  def readInput(fileName) do
    File.read!(fileName) |> String.trim() |> String.split("\n\n")
  end

  test "part1_and_2" do
    assert Day04.part1_and_2(readInput("exampleInput")) == 2
    assert Day04.part1_and_2(readInput("fourInvalid")) == 0
    assert Day04.part1_and_2(readInput("fourValid")) == 4
    assert Day04.part1_and_2(readInput("quizInput")) == 133
  end
end
