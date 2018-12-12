defmodule Day2 do

  @spec part1([]) :: integer
  def part1(input) do
    twos = Enum.count(input, fn x -> double_event?(x) end)
    threes = Enum.count(input, fn x -> triple_event?(x) end)
    twos * threes
  end

  def load_inputs(file_name) do
    File.read!(file_name) |> String.split("\n", trim: true)
  end

  @spec count_letters(String.t()) :: %{}
  defp count_letters(string_input) do
    string_input
    |> String.split("", trim: true)
    |> Enum.reduce(%{}, fn x, acc ->
      Map.update(acc, String.to_atom(x), 1, &(&1 + 1))
    end)
  end

  @spec n_event?(String.t(), integer) :: boolean
  def n_event?(string_input, n_times) do
    string_input
    |> count_letters()
    |> Map.values()
    |> Enum.any?(&(&1 == n_times))
  end

  @spec double_event?(String.t()) :: boolean
  def double_event?(string_input) do
    string_input |> n_event?(2)
  end

  @spec triple_event?(String.t()) :: boolean
  def triple_event?(string_input) do
    string_input |> n_event?(3)
  end

  def part2(inputs) do
    inputs
    |> Enum.map(&String.split(&1, "", trim: true))
    |> recur(inputs)
    |> Tuple.to_list()
    |> Enum.zip()
    |> Enum.flat_map(fn {x, y} -> 
      case x == y do
        true -> [x]
        _ -> []
      end
    end)
    |> Enum.join("")
  end

  def one_mismatch?(base_list, test_list) do
    Enum.zip(base_list, test_list)
    |> Enum.count(fn {x, y} -> x != y end)
    |> (fn x -> x == 1 end).()
  end

  def recur([]), do: {}

  def recur([head | tail]), do: recur(tail, head)

  def recur(inputs, input) do
    case Enum.find(inputs, nil, &one_mismatch?(&1, input)) do
      nil -> recur(inputs)
      result -> {input, result}  
    end
  end

end