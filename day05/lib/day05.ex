defmodule Day05 do
  def split_seats(seats) do
    Enum.split(seats, div(length(seats), 2))
  end

  def calculateSeat(seats, "L" <> cs) do
    {l, _} = split_seats(seats)

    calculateSeat(l, cs)
  end

  def calculateSeat(seats, "R" <> cs) do
    {_, r} = split_seats(seats)

    calculateSeat(r, cs)
  end

  def calculateSeat(seats, "") do
    Enum.at(seats, 0)
  end

  def calculateSeatId(pattern) do
    {rowPattern, columnPattern} = String.split_at(pattern, 7)
    rowList = Enum.to_list(0..127)
    colList = Enum.to_list(0..7)

    row =
      calculateSeat(rowList, rowPattern |> String.replace("F", "L") |> String.replace("B", "R"))

    col = calculateSeat(colList, columnPattern)

    row * 8 + col
  end

  def part1(input) do
    Enum.max(Enum.map(input, &calculateSeatId/1))
  end

  def part2(input) do
    ids = Enum.map(input, &calculateSeatId/1) |> Enum.sort()
    findSeat(ids)
  end

  def findSeat([a, b | rest]) when a + 1 == b do
    findSeat(rest)
  end

  def findSeat([a, b | _]) when a + 2 == b do
    a + 1
  end
end
