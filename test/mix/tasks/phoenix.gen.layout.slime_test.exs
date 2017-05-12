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

  describe "when :use_slime_extension env is set to true" do
    setup do
      Application.put_env(:phoenix_slime, :use_slime_extension, true)
      on_exit fn ->
        Application.delete_env(:phoenix_slime, :use_slime_extension)
      end
      :ok
    end

    test "generates a file with .slime extension " do
      in_tmp "generates .slime", fn ->
        Mix.Tasks.Phoenix.Gen.Layout.Slime.run []
        assert File.exists? "web/templates/layout/app.html.slime"
      end
    end
  end
end
