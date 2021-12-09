defmodule Two do
  def return_pair(str) do
    case str do
      "forward " <> num -> {String.to_integer(num), 0}
      "down " <> num -> {0, String.to_integer(num)}
      "up " <> num -> {0, -String.to_integer(num)}
    end
  end
end

# {horizontal,depth}
{:ok, contents} = File.read("../2.txt")

{horizontal, depth} =
  contents
  |> String.split("\n", trim: true)
  |> Enum.map(&Two.return_pair/1)
  |> Enum.reduce(fn {a, b}, {c, d} -> {a + c, b + d} end)
  |> IO.inspect()

IO.puts("The final result is #{horizontal * depth}")
