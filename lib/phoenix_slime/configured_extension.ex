defmodule PhoenixSlime.ConfiguredExtension do
  def file_extension do
    case Application.fetch_env(:phoenix_slime, :use_slim_extension) do
      {:ok, true} -> "slim"
      _ -> "slime"
    end
  end
end
