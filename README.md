# Phoenix Template Engine for Slim

[![Build Status][travis-img]][travis] [![Hex Version][hex-img]][hex] [![License][license-img]][license]

> Powered by [Slime](https://github.com/slime-lang/slime)

[travis-img]: https://travis-ci.org/slime-lang/phoenix_slime.png?branch=master
[travis]: https://travis-ci.org/slime-lang/phoenix_slime
[hex-img]: https://img.shields.io/hexpm/v/phoenix_slime.svg
[hex]: https://hex.pm/packages/phoenix_slime
[license-img]: http://img.shields.io/badge/license-MIT-brightgreen.svg
[license]: http://opensource.org/licenses/MIT

## Usage

  1. Add `{:phoenix_slime, "~> 0.4.1"}` to your deps in `mix.exs`.
  2. Add the following your Phoenix `config/config.exs`:

```elixir
  config :phoenix, :template_engines,
    slim: PhoenixSlime.Engine
   slime: PhoenixSlime.Engine
```

An example project can be found at [slime-lang/phoenix_slime_example][phoenix-slime-example].

[phoenix-slime-example]: https://github.com/slime-lang/phoenix_slime

## Live Reloader
In `my_app/config/dev.exs`, include the `slim` and `slime` extensions in the list of watched files.

```elixir
# Watch static and templates for browser reloading.
config :my_app, MyApp.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex|slim|slime)$}
    ]
  ]
```

## License

MIT license. Please see [LICENSE][license] for details.

[LICENSE]: https://github.com/slime-lang/slime/blob/master/LICENSE
