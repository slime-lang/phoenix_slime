defmodule PhoenixSlime.Mixfile do
  use Mix.Project

  @version "0.5.1"

  def project do
    [
      app: :phoenix_slime,
      deps: deps,
      description: """
      Phoenix Template Engine for Slim-like templates
      """,
      elixir: "~> 1.0",
      package: package,
      version: @version]
  end

  def application do
    [applications: [:phoenix, :slime]]
  end

  def deps do
    [{:phoenix, "~> 1.1 or ~> 1.2-rc"},
     {:phoenix_html, "~> 2.3"},
     {:cowboy, "~> 1.0"},
     {:slime, "~> 0.12.2"}]
  end

  defp package do
    [maintainers: ["Sean Callan"],
     files: ["lib", "priv", "mix.exs", "README*", "LICENSE*"],
     licenses: ["MIT"],
     links: %{github: "https://github.com/slime-lang/phoenix_slime"}]
  end
end
