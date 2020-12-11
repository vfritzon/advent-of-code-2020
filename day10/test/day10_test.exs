defmodule Day10Test do
  use ExUnit.Case
  doctest Day10

  def readInput(fileName) do
    File.read!(fileName) |> String.trim() |> String.split("\n") |> Enum.map(&String.to_integer/1)
  end

  test "part1" do
    assert Day10.part1([16, 10, 15, 5, 1, 11, 7, 19, 6, 12, 4]) == %{1 => 7, 3 => 5}
    assert Day10.part1(readInput("quizInput")) == %{1 => 67, 3 => 28}
  end
end
