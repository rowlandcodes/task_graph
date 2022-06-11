defmodule TaskGraph do
  def main(args) do
    # edges = TaskGraph.Input.load_edges(args |> Enum.at(0))
    # completed = TaskGraph.Input.load_completed(args |> Enum.at(1))
    {edges, vertices, completed} = TaskGraph.Input.Yaml.parse(args |> Enum.at(0))

    {_, available, blocked} = TaskGraph.Logic.find_available(edges, vertices, completed)
    output = TaskGraph.Formatter.format(completed, available, blocked)
    IO.puts(output)
  end
end
