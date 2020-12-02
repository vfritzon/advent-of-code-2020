defmodule Day02Test do
  use ExUnit.Case
  doctest Day02

  test "part1" do
    assert Day02.part1("exampleInput") == 2
    assert Day02.part1("quizInput") == 454
  end

  test "part2" do
    assert Day02.part2("exampleInput") == 1
    assert Day02.part2("quizInput") == 649
  end
end
