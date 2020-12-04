defmodule Day04 do
  def part1_and_2(passports) do
    passports
    |> Enum.map(&extract_fields/1)
    |> Enum.count(&validate_passport/1)
  end

  def extract_fields(passport) do
    Regex.scan(~r/([[:word:]]{3}):([[:graph:]]+)/, passport)
    |> Enum.map(&Enum.drop(&1, 1))
  end

  def validate_passport(passport_fields) do
    keys = Enum.map(passport_fields, &List.first/1)
    has_required_fields = has_all_required_fields(keys)
    fields_are_valid = Enum.all?(passport_fields, &validate_field/1)

    has_required_fields && fields_are_valid
  end

  def has_all_required_fields(passport_fields) do
    required_fields =
      MapSet.new([
        "ecl",
        "pid",
        "eyr",
        "hcl",
        "byr",
        "iyr",
        "hgt"
      ])

    MapSet.subset?(required_fields, MapSet.new(passport_fields))
  end

  def validate_field(field) do
    case field do
      ["byr", value] ->
        year = String.to_integer(value)
        year >= 1920 && year <= 2002

      ["iyr", value] ->
        year = String.to_integer(value)
        year >= 2010 && year <= 2020

      ["eyr", value] ->
        year = String.to_integer(value)
        year >= 2020 && year <= 2030

      ["hgt", value] ->
        case Integer.parse(value) do
          :error -> false
          {h,"cm"} -> h >= 150 && h <= 193
          {h,"in"} -> h >= 59 && h <= 76
          _ -> false
        end
      ["hcl", value] ->
        Regex.match?(~r/^#[0-9,a-f]{6}$/, value)

      ["ecl", value] ->
        Enum.member?(["amb", "blu", "brn", "gry", "grn", "hzl", "oth"], value)

      ["pid", value] ->
        Regex.match?(~r/^[[:digit:]]{9}$/, value)

      ["cid", _] ->
        true

      _ ->
        false
    end
  end
end
