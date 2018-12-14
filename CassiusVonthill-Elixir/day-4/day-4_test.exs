Code.load_file("day-4.exs", __DIR__)

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule Day4Test do
  use ExUnit.Case

  test "Part 1 examples" do
    answer =
      Day4.load_inputs("test-input-1.txt")
      |> Day4.part1()

    assert answer == 240
  end

  @tag :pending
  test "Part 1 challenge" do
    answer =
      Day4.load_inputs("main-input.txt")
      |> Day4.part1()

    assert answer == 110827
  end

  @tag :pending
  test "Part 2 examples" do
    answer =
      Day4.load_inputs("test-input-1.txt")
      |> Day4.part2()

    assert answer == 3
  end

  @tag :pending
  test "Part 2 challenge" do
    answer =
      Day4.load_inputs("main-input.txt")
      |> Day4.part2()

    assert answer == 116
  end

end