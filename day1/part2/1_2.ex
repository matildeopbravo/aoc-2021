{:ok, contents} = File.read("../input/1.txt")

contents
|> String.split("\n", trim: true)
|> Enum.map(&String.to_integer/1)
|> Enum.chunk_every(3, 1)
|> Enum.chunk_every(2, 1, :discard)
|> Enum.count(fn [left, right] -> Enum.sum(right) > Enum.sum(left) end)
|> IO.inspect()
