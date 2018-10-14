Code.require_file("../mix_helper.exs", __DIR__)

defmodule Mix.Tasks.Phx.Gen.Layout.SlimeTest do
  use ExUnit.Case
  import MixHelper

  setup do
    Mix.Task.clear()
    :ok
  end

  test "generates a slime layout file" do
    in_tmp("generates slime layout file", fn ->
      Mix.Tasks.Phx.Gen.Layout.Slime.run([])

      assert_file("lib/phoenix_slime_web/templates/layout/app.html.slime", fn file ->
        assert file =~ "Hello PhoenixSlime"
        assert file =~ "p.alert.alert-info"
        assert file =~ "p.alert.alert-danger"
      end)
    end)
  end

  describe "when :use_slim_extension env is set to true" do
    setup do
      Application.put_env(:phoenix_slime, :use_slim_extension, true)

      on_exit(fn ->
        Application.delete_env(:phoenix_slime, :use_slim_extension)
      end)

      :ok
    end

    test "generates a file with .slim extension " do
      in_tmp("generates .slim", fn ->
        Mix.Tasks.Phx.Gen.Layout.Slime.run([])
        assert File.exists?("lib/phoenix_slime_web/templates/layout/app.html.slim")
      end)
    end
  end
end
