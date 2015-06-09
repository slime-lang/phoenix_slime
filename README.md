# Phoenix Template Engine for Haml

> Powered by [Calliope](https://github.com/nurugger07/calliope)


## Usage

  1. Add `{:phoenix_haml, "~> 0.0.5"}` to your deps in mix.exs. If you generated your app from the Phoenix master branch, add phoenix_haml's master branch to your deps instead. `{:phoenix_haml, github: "chrismccord/phoenix_haml"}`
  2. Add the following your Phoenix `config/config.exs`

```elixir
  config :phoenix, :template_engines,
    haml: PhoenixHaml.Engine
```
