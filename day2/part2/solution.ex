defmodule Two do
  def return_pair(str) do
    case str do
      "forward " <> num -> {String.to_integer(num), String.to_integer(num), 0}
      "down " <> num -> {0, 0, String.to_integer(num)}
      "up " <> num -> {0, 0, -String.to_integer(num)}
    end
  end
end

# {horizontal,depth, aim}
{:ok, contents} = File.read("../2.txt")

{horizontal, depth, aim} =
  contents
  |> String.split("\n", trim: true)
  |> Enum.map(&Two.return_pair/1)
  |> Enum.reduce({0, 0, 0}, fn {a, b, c}, {acc_a, acc_b, acc_c} ->
    {a + acc_a, acc_b + acc_c * b, c + acc_c}
  end)
  |> IO.inspect()

IO.puts("The final result is #{horizontal * depth}")
