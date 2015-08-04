defmodule PhoenixSlimTest do
  use ExUnit.Case
  alias Phoenix.View

  defmodule MyApp.PageView do
    use Phoenix.View, root: "test/fixtures/templates"

    use Phoenix.HTML
  end

  test "render a slim template with layout" do
    html = View.render(MyApp.PageView, "new.html",
      message: "hi",
      layout: {MyApp.PageView, "application.html"}
    )
    assert html == {:safe, [[["" | "<html><body>"], "" | "<h2>New Template</h2>"] | "</body></html>"]}
  end

  test "render a haml template without layout" do
    html = View.render(MyApp.PageView, "new.html", [])
    assert html == {:safe, ["" | "<h2>New Template</h2>"]}
  end
end
