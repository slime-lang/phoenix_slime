defmodule PhoenixSlime.LiveViewEngine do
  @moduledoc """
  The LiveView Engine for Slime
  """

  @behaviour Phoenix.Template.Engine

  @doc """
  Precompiles the String file_path into a function definition
  """
  def compile(path, _name) do
    path
    |> read!()
    |> EEx.compile_string(engine: Phoenix.LiveView.Engine, file: path, line: 1)
  end

  defp read!(file_path) do
    file_path
    |> File.read!()
    |> Slime.Renderer.precompile()
  end
end
