defmodule Day10 do
  use Agent
  def start do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def part1(adapters) do
    sorted_adapters =
      adapters
      |> Enum.sort()
      |> Enum.to_list()

    ([0] ++ sorted_adapters ++ [List.last(sorted_adapters) + 3])
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(fn [a, b] -> b - a end)
    |> Enum.frequencies()
  end

  def part2(adapters) do
    sorted_adapters =
      ([0] ++ adapters)
      |> Enum.sort()
      |> Enum.to_list()

    compatibility =
      sorted_adapters
      |> Enum.chunk_every(4, 1)
      |> Enum.map(fn [k | rest] ->
        {k, Enum.filter(rest, &(&1 - k <= 3))}
      end)
      |> Map.new()

    count_paths(List.first(sorted_adapters), List.last(sorted_adapters), compatibility)
  end

  defp count_paths(current, target, compatibility) do
    memoized_value = Agent.get(__MODULE__, &Map.get(&1, current))
    in_reach = target - current <= 3 && target !== current

    case {memoized_value, in_reach} do
      {nil, true}  ->
        paths = 1 +
          (Map.get(compatibility, current, [])
           |> Enum.map(&count_paths(&1, target, compatibility))
           |> Enum.sum())
        Agent.update(__MODULE__, &(Map.put(&1, current, paths)))
        paths
      {nil, false} -> 
        paths = Map.get(compatibility, current, [])
        |> Enum.map(&count_paths(&1, target, compatibility))
        |> Enum.sum()
        Agent.update(__MODULE__, &(Map.put(&1, current, paths)))
        paths
      {value, _} -> value
    end
  end
end

Day10.start
IO.inspect(Day10.part2(File.read!("quizInput") |> String.trim() |> String.split("\n") |> Enum.map(&String.to_integer/1)))
