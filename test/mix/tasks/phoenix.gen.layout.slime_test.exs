Code.require_file "../mix_helper.exs", __DIR__

defmodule Mix.Tasks.Phoenix.Gen.Layout.SlimeTest do
  use ExUnit.Case
  import MixHelper

  setup do
    Mix.Task.clear
    :ok
  end

  test "generates a slime layout file" do
    in_tmp "generates slime layout file", fn ->
      Mix.Tasks.Phoenix.Gen.Layout.Slime.run []

      assert_file "web/templates/layout/app.html.slim", fn file ->
        assert file =~ "p.alert.alert-info"
        assert file =~ "p.alert.alert-danger"
      end

    end
  end
end
