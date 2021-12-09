{:ok, contents} = File.read("../1.txt")

contents
|> String.split("\n", trim: true)
|> Enum.map(&String.to_integer/1)
|> Enum.chunk_every(2, 1, :discard)
|> Enum.count(fn [a, b] -> b > a end)
|> IO.inspect()
