defmodule PhoenixSlim.Engine do
  @behaviour Phoenix.Template.Engine

  @doc """
  Precompiles the String file_path into a function defintion, using SlimFast
  """
  def compile(path, _name) do
    path
    |> read!
    |> EEx.compile_string(engine: Phoenix.HTML.Engine, file: path, line: 1)
  end

  defp read!(file_path) do
    file_path
    |> File.read!
    |> SlimFast.Renderer.precompile
  end
end
