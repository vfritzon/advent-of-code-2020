defmodule Day06Test do
  use ExUnit.Case
  doctest Day06

  def readInput(fileName) do
    File.read!(fileName) |> String.trim() |> String.split("\n\n")
  end

  test "part1" do
    assert Day06.part1(readInput("exampleInput")) == 11
    assert Day06.part1(readInput("quizInput")) == 6878
  end

  test "part2" do
    assert Day06.part2(readInput("exampleInput")) == 6
    assert Day06.part2(readInput("quizInput")) == 3464
  end
end
