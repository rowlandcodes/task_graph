defmodule TaskGraph.Formatter do
  def format(completed, available, blocked) do
    c_text = Enum.map(completed, &apply_color(&1, IO.ANSI.green()))
    a_text = Enum.map(available, &apply_color(&1, IO.ANSI.yellow()))
    b_text = Enum.map(blocked, &apply_color(&1, IO.ANSI.red()))
    Enum.join(Enum.concat([c_text, a_text, b_text]), "\n")
  end

  defp apply_color(text, color) do
    color <> "#{text}" <> IO.ANSI.reset()
  end
end
