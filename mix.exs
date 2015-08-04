defmodule PhoenixSlim.Mixfile do
  use Mix.Project

  def project do
    [
      app: :phoenix_slim,
      version: "0.1.0",
      elixir: "~> 1.0",
      deps: deps,
      package: [
        contributors: ["Sean Callan"],
        licenses: ["MIT"],
        links: %{github: "https://github.com/doomspork/phoenix_slim"}
      ],
      description: """
      Phoenix Template Engine for Slim
      """
    ]
  end

  def application do
    [applications: [:phoenix, :slim_fast]]
  end

  defp deps do
    [
      {:phoenix, "~> 0.15.0"},
      {:phoenix_html, "~> 2.0"},
      {:cowboy, "~> 1.0", only: [:dev, :test]},
      {:slim_fast, "~> 0.2.0"}
    ]
  end
end
