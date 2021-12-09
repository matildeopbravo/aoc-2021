{:ok, contents} = File.read("../1.txt")

contents
|> String.split("\n", trim: true)
|> Enum.map(&String.to_integer/1)
|> Enum.reduce(
  {:infinity, 0},
  fn x, {anterior, result} ->
    result = if x > anterior, do: result + 1, else: result
    {x, result}
  end
)
|> elem(1)
|> IO.inspect()
