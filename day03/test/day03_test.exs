defmodule Day03Test do
  use ExUnit.Case
  doctest Day03

  def readInput(fileName) do
    String.split(File.read!(fileName), "\n")
  end

  test "part1" do
    assert Day03.part1(readInput("exampleInput")) == 7
    assert Day03.part1(readInput("quizInput")) == 242
  end

  test "part2" do
    assert Day03.part2(readInput("exampleInput")) == 336
    assert Day03.part2(readInput("quizInput")) == 2_265_549_792
  end
end
