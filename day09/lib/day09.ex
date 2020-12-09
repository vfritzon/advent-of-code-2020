defmodule Day09 do
  def part1(input, preamble_length) do
    numbers = input |> Enum.map(&String.to_integer/1)

    find_it(numbers, preamble_length)
  end

  defp find_it(numbers, preamble_length) do
    {preamble, [e | rest]} = Enum.split(numbers, preamble_length)

    summing_pairs = for i <- preamble, j <- preamble, i != j && i + j == e, do: {i, j}

    if Enum.empty?(summing_pairs),
      do: e,
      else: find_it(Enum.drop(preamble, 1) ++ [e] ++ rest, preamble_length)
  end

  def part2(input, invalid_number) do
    numbers = input |> Enum.map(&String.to_integer/1)
    find_them(numbers, invalid_number)
  end

  defp find_them([e | rest], invalid_number) do
    {sum, numbers} =
      Enum.reduce_while([e | rest], {0, []}, fn x, {sum, numbers} ->
        if sum + x < invalid_number,
          do: {:cont, {sum + x, numbers ++ [x]}},
          else: {:halt, {sum + x, numbers ++ [x]}}
      end)

    if sum == invalid_number, do: Enum.min_max(numbers), else: find_them(rest, invalid_number)
  end

  defp find_them([], _) do
    :meh
  end
end
