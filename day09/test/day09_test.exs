defmodule Day09Test do
  use ExUnit.Case
  doctest Day09

  def readInput(fileName) do
    File.read!(fileName) |> String.trim() |> String.split("\n")
  end

  test "part1" do
    assert Day09.part1(readInput("exampleInput"), 5) == 127
    assert Day09.part1(readInput("quizInput"), 25) == 1_639_024_365
  end

  test "part2" do
    assert Day09.part2(readInput("exampleInput"), 127) == {15, 47}
    assert Day09.part2(readInput("quizInput"), 1_639_024_365) == {66_794_732, 152_407_508}
  end
end
