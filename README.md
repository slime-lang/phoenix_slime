# Phoenix Template Engine for Haml

> Powered by [SlimFast](https://github.com/doomspork/slim_fast)

## Usage

  1. Add `{:phoenix_slim, "~> 0.1.0"}` to your deps in `mix.exs`.
  2. Add the following your Phoenix `config/config.exs`:

```elixir
  config :phoenix, :template_engines,
    slim: PhoenixSlim.Engine
```

## License

Please see [LICENSE](https://github.com/doomspork/slim_fast/blob/master/LICENSE) for licensing details.
