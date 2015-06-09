# Phoenix Template Engine for Haml

> Powered by [Calliope](https://github.com/nurugger07/calliope)


## Usage

  1. Add `{:phoenix_haml, github: "programisti/phoenix_haml"}` to your deps in `mix.exs`.
  2. Add the following your Phoenix `config/config.exs`

```elixir
  config :phoenix, :template_engines,
    haml: PhoenixHaml.Engine
```


I forked this because it was locked at 12.0 version of phoenix so i have changed it to 13.1
more details here: https://github.com/chrismccord/phoenix_haml/issues/12
