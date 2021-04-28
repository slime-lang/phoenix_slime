defmodule PhoenixSlime.ConfiguredExtension do
  @moduledoc """
  Tell Phoenix the file extensions to look for based on the current configuration
  """

  def file_extension do
    case Application.fetch_env(:phoenix_slime, :use_slim_extension) do
      {:ok, true} -> "slim"
      _ -> "slime"
    end
  end
end
