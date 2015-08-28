defmodule PhoenixSlim.Mixfile do
  use Mix.Project

  @version "0.4.0"

  def project do
    [
      app: :phoenix_slim,
      deps: deps,
      description: """
      Phoenix Template Engine for Slim
      """,
      elixir: "~> 1.0",
      package: package,
      version: @version]
  end

  def application do
    [applications: [:phoenix, :slim_fast]]
  end

  def deps do
    [{:phoenix, ">= 0.16.0"},
     {:phoenix_html, ">= 2.1.0"},
     {:cowboy, "~> 1.0", only: [:dev, :test]},
     {:slim_fast, ">= 0.6.0"}]
  end

  defp package do
    [contributors: ["Sean Callan"],
     files: ["lib", "mix.exs", "README*", "LICENSE*"],
     licenses: ["MIT"],
     links: %{github: "https://github.com/doomspork/phoenix_slim"}]
  end
end
