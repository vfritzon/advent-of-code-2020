defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  test "testInput" do
    assert Day01.part1('testInput') == 514579
    assert Day01.part2('testInput') == 241861950
  end

  test "puzzleInput" do
    assert Day01.part1('puzzleInput') == 840324
    assert Day01.part2('puzzleInput') == 170098110
  end
end
