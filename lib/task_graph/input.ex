defmodule TaskGraph.Input do
  def load_edges(file) do
    File.read!(file)
    |> parse_edges()
  end

  defp parse_edges(text) do
    text
    |> String.split()
    |> Enum.chunk_every(2)
    |> Enum.map(&List.to_tuple/1)
  end

  def load_completed(file) do
    File.read!(file)
    |> parse_completed()
  end

  defp parse_completed(text) do
    text
    |> String.trim()
    |> String.split("\n")
  end
end
