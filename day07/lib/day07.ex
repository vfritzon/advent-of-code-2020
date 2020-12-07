defmodule Day07 do
  def part1(input) do
    scan_line = fn line ->
      Regex.scan(~r/(\w+ \w+) bag|bags/, line) |> Enum.map(fn m -> Enum.at(m, 1) end)
    end

    can_contain =
      input
      |> Enum.filter(fn s -> !String.ends_with?(s, "contain no other bags.") end)
      |> Enum.map(scan_line)
      |> Enum.map(fn [k | bags] -> {k, bags} end)
      |> Map.new()

    calculate_contain_chain(["shiny gold"], can_contain)
    |> Enum.to_list()
    |> length
  end

  def lists_intersect?(as, bs) do
    intersection =
      MapSet.intersection(MapSet.new(as), MapSet.new(bs))
      |> Enum.to_list()

    length(intersection) > 0
  end

  def calculate_contain_chain(bags, can_contain) do
    bags_that_can_contain_any_of_the_bags =
      can_contain
      |> Enum.filter(fn {_, bs} -> lists_intersect?(bags, bs) end)
      |> Enum.map(fn {k, _} -> k end)

    case bags_that_can_contain_any_of_the_bags do
      [] -> MapSet.new()
      bs -> MapSet.union(MapSet.new(bs), calculate_contain_chain(bs, can_contain))
    end
  end

  def part2(input) do
    scan_line = fn line ->
      [b, contains] = String.split(line, "bags contain") |> Enum.map(&String.trim/1)

      parsed_contains =
        Regex.scan(~r/(\d+) (\w+ \w+)/, contains)
        |> Enum.map(fn [_, count, color] -> {String.to_integer(count), String.to_atom(color)} end)

      {String.to_atom(b), parsed_contains}
    end

    contain_map =
      input
      |> Enum.map(scan_line)
      |> Map.new()

    collect_bags(contain_map, {1, :"shiny gold"}) - 1
  end

  def collect_bags(contain_map, {count, bag}) do
    more_bags = contain_map[bag]

    case more_bags do
      [] ->
        count

      bags ->
        count + Enum.sum(Enum.map(bags, fn b -> count * collect_bags(contain_map, b) end))
    end
  end
end
