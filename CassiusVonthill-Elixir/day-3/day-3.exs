defmodule Day3 do

  def load_inputs(file_name) do
    File.read!(file_name) |> String.split("\n", trim: true)
  end

  def part1(inputs) do
    inputs
    |> compile_data()
    |> Map.values()
    # |> IO.inspect()
    |> Enum.count(&(Kernel.length(&1) != 1))
  end

  def part2(inputs) do
    all_ids =
      inputs
      |> Stream.map(&String.split(&1, " ", trim: true))
      |> Stream.map(fn [ h | _t ] -> h end) # IDs are the first item in the list
      |> MapSet.new()

    overlaps = 
      inputs
      |> compile_data()
      |> Map.values()
      |> Enum.filter(&(Kernel.length(&1) > 1))
      |> List.flatten()
      |> MapSet.new()

    MapSet.difference(all_ids, overlaps)
    |> MapSet.to_list()
    |> List.first()
    |> String.slice(1..10)
    |> String.to_integer()
  end

  def parse_input(string_input) do
    extract_digits = fn string_input -> 
      string_input
      |> (&Regex.scan(~r/\d+/, &1)).()
      |> List.flatten()
      |> Enum.map(&String.to_integer(&1))
      |> List.to_tuple()
    end

    {id, _at, offsets, area} =
      string_input
      |> String.split(" ", trim: true)
      |> List.to_tuple()
      
    offset_tuple = offsets |> extract_digits.()

    area_tuple = area |> extract_digits.()

    {id, offset_tuple, area_tuple}
  end

  def generate_keys({id, {x_offset, y_offset}, {width, height}}) do
    Enum.map(Range.new(1, height), fn h -> 
      for w <- Range.new(1, width) do
        {id, {x_offset + w, y_offset + h}}
      end
    end)
  end

  def compile_data(inputs) do
    inputs
    |> Stream.map(&parse_input(&1))
    |> Stream.map(&generate_keys(&1))
    |> Enum.to_list()
    |> List.flatten()
    |> Enum.reduce(%{}, fn {id, tup}, acc -> 
      Map.update(acc, tup, [id], &([ id | &1]))
    end)
  end
  
end