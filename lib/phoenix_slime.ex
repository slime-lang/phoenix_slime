defmodule PhoenixSlime do
  @doc """
  Provides the `~l` sigil with HTML safe Slime syntax inside source files.

  Raises on attempts to interpolate with `\#{}`. Use `~L` to interpolate.

      iex> import PhoenixSlime
      iex> assigns = %{w: "world"}
      iex> ~l"\""
      ...> p = "hello " <> @w
      ...> "\""
      {:safe, [[["" | "<p>"] | "hello world"] | "</p>"]}
  """
  defmacro sigil_l(expr, opts) do
    handle_sigil(expr, opts, __CALLER__.line)
  end

  @doc """
  Provides the `~L` sigil with HTML safe Slime syntax inside source files.

      iex> import PhoenixSlime
      iex> ~L"\""
      ...> p hello \#{"world"}
      ...> "\""
      {:safe, ["" | "<p>hello world</p>"]}
  """
  defmacro sigil_L(expr, opts) do
    handle_sigil(expr, opts, __CALLER__.line)
  end

  defp handle_sigil({:<<>>, _, [expr]}, [], line) do
    expr
    |> Slime.Renderer.precompile()
    |> EEx.compile_string(engine: Phoenix.HTML.Engine, line: line + 1)
  end

  defp handle_sigil(_, _, _) do
    raise ArgumentError, "Interpolation is not allowed in ~l sigil." <>
      "Remove the interpolation, use = to insert values, or " <>
        "use ~L to interpolate."
  end
end
