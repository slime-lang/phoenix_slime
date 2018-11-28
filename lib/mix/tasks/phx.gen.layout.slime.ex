defmodule Mix.Tasks.Phx.Gen.Layout.Slime do
  use Mix.Task

  @shortdoc "Generates a default Phoenix layout file in Slime"

  @moduledoc """
  Generates a Phoenix layout file in Slime.

      mix phx.gen.layout.slime

  """
  def run(_args) do
    context_app = Mix.Phoenix.context_app()
    web_prefix = Mix.Phoenix.web_path(context_app)
    binding = [application_module: Mix.Phoenix.base()]

    extension = PhoenixSlime.ConfiguredExtension.file_extension()

    Mix.Phoenix.copy_from(slime_paths(), "priv/templates/phx.gen.layout.slime", binding, [
      {:eex, "app.html.eex", "#{web_prefix}/templates/layout/app.html.#{extension}"}
    ])

    instructions = """

    A new #{web_prefix}/templates/layout/app.html.#{extension} file was generated.
    """

    Mix.shell().info(instructions)
  end

  defp slime_paths do
    [".", :phoenix_slime]
  end
end
