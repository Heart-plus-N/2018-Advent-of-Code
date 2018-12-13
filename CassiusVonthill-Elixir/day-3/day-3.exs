defmodule Day3 do

  def load_inputs(file_name) do
    File.read!(file_name) |> String.split("\n", trim: true)
  end

  def part1(inputs) do
    
  end

  def parse_input(string_input) do

    split_to_tuple = fn string_input, delimiter -> 
      string_input |> String.split(delimiter, trim: true) |> List.to_tuple()
    end

    {_id, _at, offsets, area} = split_to_tuple.(string_input, " ")
      
    offset_tuple =
      offsets
      |> split_to_tuple.("")
      |> (fn {a, _b, c, _d} -> {a, c} end).()

    area_tuple =
      area
      |> split_to_tuple.("")
      |> (fn {a, _b, c} -> {a, c} end).()

    {offset_tuple, area_tuple}

  end
  
end