Code.load_file("day-3.exs", __DIR__)

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule Day3Test do
  use ExUnit.Case

  test "Part 1 examples" do
    answer =
      Day3.load_inputs("test-input-1.txt")
      |> Day3.part1()

    assert answer == 4
  end

  test "Part 1 challenge" do
    answer =
      Day3.load_inputs("main-input.txt")
      |> Day3.part1()

    assert answer == 110827
  end

  test "Part 2 examples" do
    answer =
      Day3.load_inputs("test-input-1.txt")
      |> Day3.part2()

    assert answer == 3
  end

  test "Part 2 challenge" do
    answer =
      Day3.load_inputs("main-input.txt")
      |> Day3.part2()

    assert answer == 116
  end

end