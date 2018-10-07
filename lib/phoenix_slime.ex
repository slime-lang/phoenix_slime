defmodule PhoenixSlime do
  defmacro sigil_l(expr, opts) do
    handle_sigil(expr, opts, __CALLER__.line)
  end

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
