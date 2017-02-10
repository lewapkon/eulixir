defmodule Mix.Tasks.Eulixir do
  use Mix.Task

  @shortdoc "Run problems from Project Euler"

  def run(args) do
    args
    |> Enum.each(&run_problem(&1))
  end

  defp run_problem(nr) do
    IO.puts("Solution for problem #{nr}:")
    padded_nr = String.pad_leading(nr, 3, "0")
    {res, _} = Code.eval_string("Eulixir.Problem#{padded_nr}.solution")
    IO.puts(res)
  end
end