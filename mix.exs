defmodule TaskGraph.MixProject do
  use Mix.Project

  def project do
    [
      app: :task_graph,
      version: "0.1.0",
      escript: escript(),
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def escript() do
    [main_module: TaskGraph]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:libgraph, "~> 0.13.3"},
      {:yaml_elixir, "~> 2.9"}
    ]
  end
end
