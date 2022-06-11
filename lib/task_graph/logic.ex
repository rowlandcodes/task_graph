defmodule TaskGraph.Logic do
  @spec find_available([{any(), any()}], [], []) :: {list(), list(), list()}
  def find_available(edges, vertices, completed) do
    full_graph =
      Graph.new(type: :directed)
      |> Graph.add_edges(edges)
      |> Graph.add_vertices(vertices)

    if Graph.is_cyclic?(full_graph) do
      IO.puts("You have circular dependencies!")
      System.halt(1)
    end

    uncompleted_graph = Graph.delete_vertices(full_graph, completed)

    available =
      Enum.reject(Graph.vertices(uncompleted_graph), &has_in_edges?(uncompleted_graph, &1))

    blocked = Graph.delete_vertices(uncompleted_graph, available) |> Graph.vertices()

    {completed, available, blocked}
  end

  defp has_in_edges?(graph, vertex) do
    Graph.in_degree(graph, vertex) > 0
  end
end

defmodule TaskGraph.CyclicError do
  defexception message: "You have circular dependencies!"
end
