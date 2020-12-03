defmodule Day03 do
  def part1(input) do
    map = calculate_map(input, 1)

    calculate_collisions(map, 3)
  end

  def calculate_map(input, down_steps) do
    input
    |> Enum.map(fn l -> String.graphemes(l) end)
    |> Enum.filter(fn l -> !Enum.empty?(l) end)
    |> Enum.with_index()
    |> Enum.filter(fn {_, i} -> rem(i, down_steps) == 0 end)
    |> Enum.map(fn {x, _} -> x end)
  end

  def calculate_collisions(map, right_steps) do
    map_width = Enum.count(Enum.at(map, 0))

    {path, _} =
      map
      |> Enum.reduce({[], 0}, fn row, {c, x} ->
        {[Enum.at(row, rem(x, map_width)) | c], x + right_steps}
      end)

    Enum.count(path, fn tile -> tile == "#" end)
  end

  def part2(input) do
    collisions =
      [{1, 1}, {3, 1}, {5, 1}, {7, 1}, {1, 2}]
      |> Enum.map(fn {right, down} -> calculate_collisions(calculate_map(input, down), right) end)

    collisions |> Enum.reduce(fn e, acc -> acc * e end)
  end
end
