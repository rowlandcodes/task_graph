defmodule TaskGraph.Input.Yaml do
  def parse(file) do
    yaml = YamlElixir.read_from_file!(file)
    completed = extract_completed(yaml)
    edges = extract_edges(yaml)
    vertices = Map.keys(yaml)
    {edges, vertices, completed}
  end

  defp extract_completed(yaml) do
    Map.filter(yaml, fn {_key, value} -> Map.get(value, "completed", false) end)
    |> Map.keys()
  end

  defp extract_edges(yaml) do
    Enum.map(yaml, fn {key, val} -> {key, Map.get(val, "depends_on", nil)} end)
    |> Enum.map(&combine_edges/1)
    |> Enum.concat()
  end

  defp combine_edges({vertice, dependencies}) when is_list(dependencies) do
    Enum.map(dependencies, fn v -> {v, vertice} end)
  end

  defp combine_edges({vertice, dependency}) when is_binary(dependency) do
    [{dependency, vertice}]
  end

  defp combine_edges(_), do: []
end
