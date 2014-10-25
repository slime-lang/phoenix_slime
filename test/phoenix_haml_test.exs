defmodule PhoenixHamlTest do
  use ExUnit.Case
  alias Phoenix.View


  defmodule MyApp.View do
    use Phoenix.View, root: "test/fixtures/templates"

    using do
      use Phoenix.HTML
    end
  end

  defmodule MyApp.PageView do
    use MyApp.View
  end

  test "render a haml template with layout" do
    html = View.render(MyApp.PageView, "new.html",
      message: "hi",
      within: {MyApp.PageView, "application.html"}
    )
    assert html == {:safe, "<html><body><h2>New Template</h2></body></html>"}
  end

  test "render a haml template without layout" do
    html = View.render(MyApp.PageView, "new.html", [])
    assert html == {:safe, "<h2>New Template</h2>"}
  end
end
