defmodule PhoenixHamlTest do
  use ExUnit.Case
  alias Phoenix.View

  defmodule MyApp.Templates do
    use Phoenix.Template.Compiler, path: Path.join([__DIR__], "fixtures/templates")
  end


  test "render a haml template with layout" do
    html = View.render(MyApp.Templates, "new.html",
      message: "hi",
      within: {MyApp.Templates, "layouts/application.html"}
    )
    assert html == "<html>\n  <body>\n    <h2>New Template</h2>\n  </body>\n</html>\n"
  end

  test "render a haml template without layout" do
    html = View.render(MyApp.Templates, "new.html", [])
    assert html == "<h2>New Template</h2>"
  end
end
