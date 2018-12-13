defmodule Day3 do

  def load_inputs(file_name) do
    File.read!(file_name) |> String.split("\n", trim: true)
  end

  def part1(inputs) do
    inputs
    |> Stream.map(&parse_input(&1))
    |> Stream.flat_map(&generate_keys(&1))
  end

  def parse_input(string_input) do
    split_to_tuple = fn string_input, delimiter -> 
      string_input |> String.split(delimiter, trim: true) |> List.to_tuple()
    end

    {_id, _at, offsets, area} = split_to_tuple.(string_input, " ")
      
    offset_tuple =
      offsets
      |> split_to_tuple.("")
      |> (fn {a, _b, c, _d} -> {String.to_integer(a), String.to_integer(c)} end).()

    area_tuple =
      area
      |> split_to_tuple.("")
      |> (fn {a, _b, c} -> {String.to_integer(a), String.to_integer(c)} end).()

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