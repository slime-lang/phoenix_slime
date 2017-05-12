defmodule PhoenixSlime.ConfiguredExtension do
  def file_extension do
    case Application.fetch_env(:phoenix_slime, :use_slime_extension) do
      {:ok, true} -> "slime"
      _ -> "slim"
    end
  end
end
