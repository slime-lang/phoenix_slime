defmodule PhoenixSlime.Mixfile do
  use Mix.Project

  @version "0.13.1"

  def project do
    [
      app: :phoenix_slime,
      deps: deps(),
      description: "Phoenix Template Engine for Slim-like templates",
      elixir: "~> 1.10",
      package: package(),
      dialyzer: [plt_add_apps: [:mix]],
      version: @version
    ]
  end

  def application do
    [applications: [:phoenix, :slime]]
  end

  def deps do
    [
      {:phoenix, "~> 1.5"},
      {:phoenix_html, "~> 2.13"},
      {:jason, "~> 1.0", optional: true},
      {:slime, "~> 1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev},
      {:credo, ">= 0.0.0", only: [:dev, :test]},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Sean Callan", "Alexander Stanko"],
      files: ["lib", "priv", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/slime-lang/phoenix_slime"}
    ]
  end
end
