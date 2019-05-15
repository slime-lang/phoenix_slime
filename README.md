# Phoenix Template Engine for Slim

[![Build Status][travis-img]][travis] [![Hex Version][hex-img]][hex] [![License][license-img]][license]

> Powered by [Slime](https://github.com/slime-lang/slime)

[travis-img]: https://travis-ci.org/slime-lang/phoenix_slime.svg?branch=master
[travis]: https://travis-ci.org/slime-lang/phoenix_slime
[hex-img]: https://img.shields.io/hexpm/v/phoenix_slime.svg
[hex]: https://hex.pm/packages/phoenix_slime
[license-img]: http://img.shields.io/badge/license-MIT-brightgreen.svg
[license]: http://opensource.org/licenses/MIT

## Usage

  1. Add `{:phoenix_slime, "~> 0.12.0"}` to your deps in `mix.exs`.
  2. Add the following to your Phoenix `config/config.exs`:

```elixir
  config :phoenix, :template_engines,
    slim: PhoenixSlime.Engine,
    slime: PhoenixSlime.Engine,
    slimleex: PhoenixSlime.LiveViewEngine # If you want to use LiveView
```

An example project can be found at [slime-lang/phoenix_slime_example][phoenix_slime_example].

[phoenix_slime_example]: https://github.com/slime-lang/phoenix_slime_example

## Live Reloader
In `my_app/config/dev.exs`, include the `slim` and `slime` extensions in the list of watched files. (Replace `APP` with your app name.)

```elixir
# Watch static and templates for browser reloading.
config :my_app, MyApp.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif)$},
      ~r{web/views/.*(ex)$},
      ~r{lib/APP_web/templates/.*(eex|slim|slime)$}
    ]
  ]
```

## Generators

This library also includes two `mix` tasks:

`mix phx.gen.html.slime`
`mix phx.gen.layout.slime`

The first task creates a html resource in the same way `phx.gen.html` does
with the exception that all files are `.slime` files instead of `.eex` files.

The second task creates a new `lib/APP_web/templates/layout/app.html.slime` with the
exact same content as the `app.html.eex` file. Do not forget to remove the old
`app.html.eex` file.

Generated files have `.slime` extension by default. If you prefer `.slim`, you could add the following line to your config:

```elixir
config :phoenix_slime, :use_slim_extension, true
```

## License

MIT license. Please see [LICENSE][license] for details.

[LICENSE]: https://github.com/slime-lang/slime/blob/master/LICENSE
