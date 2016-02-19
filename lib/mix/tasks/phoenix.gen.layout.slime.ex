defmodule Mix.Tasks.Phoenix.Gen.Layout.Slime do
  use Mix.Task

  @shortdoc "Generates a default Phoenix layout file in Slime"

  @moduledoc """
  Generates a Phoenix layout file in Slime.

      mix phoenix_slime.gen.layout

  """
  def run(_args) do

    binding = [application_module: "ApplicationName"]

    Mix.Phoenix.copy_from slime_paths(), "priv/templates/phoenix.gen.layout.slime", "", binding, [
      {:eex, "app.html.eex",       "web/templates/layout/app.html.slim"}
    ]

    instructions = """

    A new web/templates/layout/app.html.slim file was generated. 
    """
    Mix.shell.info instructions
  end

  defp slime_paths do
    [".", :phoenix_slime]
  end
end
