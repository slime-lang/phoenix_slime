# Phoenix Template Engine for Slim
[![Build Status](https://img.shields.io/travis/doomspork/phoenix_slim.svg)](https://travis-ci.org/doomspork/phoenix_slim) [![Hex Version](https://img.shields.io/hexpm/v/phoenix_slim.svg)](https://hex.pm/packages/phoenix_slim)

> Powered by [SlimFast](https://github.com/doomspork/slim_fast)

## Usage

  1. Add `{:phoenix_slim, "~> 0.3.0"}` to your deps in `mix.exs`.
  2. Add the following your Phoenix `config/config.exs`:

```elixir
  config :phoenix, :template_engines,
    slim: PhoenixSlim.Engine
```

## License

Please see [LICENSE](https://github.com/doomspork/slim_fast/blob/master/LICENSE) for licensing details.
