defmodule Day08 do
  require Logger

  def part1(input) do
    input
    |> parse_program
    |> execute_program({0, 0, []})
  end

  defp parse_program(input) do
    Enum.map(input, fn l ->
      [[_, op, arg]] = Regex.scan(~r/(\w{3}) ([\+|-]\d+)/, l)
      {op, String.to_integer(arg)}
    end)
    |> Enum.to_list()
  end

  defp execute_program(program, {pc, acc, history}) do
    instruction = Enum.at(program, pc)
    {next_pc, next_acc} = execute_instruction(instruction, pc, acc)

    is_loop = Enum.member?(history, next_pc)
    reached_end = next_pc == length(program)

    case {is_loop, reached_end} do
      {false, false} -> execute_program(program, {next_pc, next_acc, [pc | history]})
      {false, true} -> {:terminate, acc}
      {true, false} -> {:loop, acc}
    end
  end

  defp execute_instruction({op, arg}, pc, acc) do
    case op do
      "nop" -> {pc + 1, acc}
      "acc" -> {pc + 1, acc + arg}
      "jmp" -> {pc + arg, acc}
    end
  end

  def part2(input) do
    program = parse_program(input)

    possible_wrong_instructions =
      program
      |> Enum.with_index()
      |> Enum.filter(fn {{op, _arg}, _i} -> op == "jmp" || op == "nop" end)
      |> Enum.map(fn {{_op, _arg}, i} -> i end)

    possible_wrong_instructions
    |> Enum.map(fn i -> execute_program(replace_instruction_at(program, i), {0, 0, []}) end)
    |> Enum.find(fn {termination, _} -> termination == :terminate end)
  end

  defp replace_instruction_at(program, i) do
    List.update_at(program, i, fn instruction ->
      case instruction do
        {"jmp", arg} -> {"nop", arg}
        {"nop", arg} -> {"jmp", arg}
        i -> i
      end
    end)
  end
end
