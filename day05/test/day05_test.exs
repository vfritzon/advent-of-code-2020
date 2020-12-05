defmodule Day05Test do
  use ExUnit.Case
  doctest Day05

  def readInput(fileName) do
    File.read!(fileName) |> String.trim() |> String.split("\n")
  end

  test "part1" do
    assert Day05.part1(readInput("quizInput")) == 883
    assert Day05.part2(readInput("quizInput")) == 532
  end
end
