defmodule Day3 do

  def load_inputs(file_name) do
    File.read!(file_name) |> String.split("\n", trim: true)
  end

  def part1(inputs) do
    inputs
    |> Stream.map(&parse_input(&1))
    |> Stream.map(&generate_keys(&1))
    |> Enum.to_list()
    |> List.flatten()
    |> Enum.reduce(%{}, fn tup, acc -> 
      Map.update(acc, tup, 1, &(&1 + 1))
    end)
    |> Map.values()
    |> Enum.count(&(&1 != 1))
  end

  def parse_input(string_input) do
    extract_digits = fn string_input -> 
      string_input
      |> (&Regex.scan(~r/\d+/, &1)).()
      |> List.flatten()
      |> Enum.map(&String.to_integer(&1))
      |> List.to_tuple()
    end

    {_id, _at, offsets, area} =
      string_input
      |> String.split(" ", trim: true)
      |> List.to_tuple()
      
    offset_tuple = offsets |> extract_digits.()

    area_tuple = area |> extract_digits.()

    {offset_tuple, area_tuple}
  end

  def generate_keys({{x_offset, y_offset}, {width, height}}) do
    Enum.map(Range.new(1, height), fn h -> 
      for w <- Range.new(1, width) do
        {x_offset + w, y_offset + h}
      end
    end)
  end
  
end