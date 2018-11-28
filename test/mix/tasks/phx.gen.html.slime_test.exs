Code.require_file("../mix_helper.exs", __DIR__)

# defmodule PhoenixSlime.DupHTMLController do
# end
#
# defmodule PhoenixSlime.DupHTMLView do
# end

defmodule Mix.Tasks.Phx.Gen.Html.SlimeTest do
  use ExUnit.Case
  import MixHelper
  alias Mix.Tasks.Phx.Gen

  setup do
    Mix.Task.clear()
    :ok
  end

  test "generates html resource" do
    in_tmp("generates html resource", fn ->
      Gen.Html.Slime.run(~w(Accounts User users name age:integer height:decimal nicks:array:text
           famous:boolean born_at:naive_datetime secret:uuid first_login:date
           alarm:time address_id:references:addresses))

      assert_file("lib/phoenix_slime/accounts/user.ex")
      assert_file("lib/phoenix_slime/accounts/accounts.ex")
      assert_file("test/phoenix_slime/accounts/accounts_test.exs")
      assert [_] = Path.wildcard("priv/repo/migrations/*_create_users.exs")

      assert_file("lib/phoenix_slime_web/templates/user/edit.html.slime", fn file ->
        assert file =~ ":action, Routes.user_path(@conn, :update, @user)"
      end)

      assert_file("lib/phoenix_slime_web/templates/user/form.html.slime", fn file ->
        assert file =~ ~s(= text_input f, :name, class: "form-control")
        assert file =~ ~s(= number_input f, :age, class: "form-control")
        assert file =~ ~s(= number_input f, :height, step: "any", class: "form-control")
        assert file =~ ~s(= checkbox f, :famous, class: "form-control")
        assert file =~ ~s(= datetime_select f, :born_at, class: "form-control")
        assert file =~ ~s(= text_input f, :secret, class: "form-control")
        assert file =~ ~s(= label f, :name, class: "control-label")
        assert file =~ ~s(= label f, :age, class: "control-label")
        assert file =~ ~s(= label f, :height, class: "control-label")
        assert file =~ ~s(= label f, :famous, class: "control-label")
        assert file =~ ~s(= label f, :born_at, class: "control-label")
        assert file =~ ~s(= label f, :secret, class: "control-label")

        refute file =~ ~s(= label f, :address_id)
        refute file =~ ~s(= number_input f, :address_id)
        refute file =~ ":nicks"
      end)

      assert_file("lib/phoenix_slime_web/templates/user/index.html.slime", fn file ->
        assert file =~ "th Name"
        assert file =~ "= for user <- @users do"
        assert file =~ "td= user.name"
      end)

      assert_file("lib/phoenix_slime_web/templates/user/new.html.slime", fn file ->
        assert file =~ ":action, Routes.user_path(@conn, :create)"
      end)

      assert_file("lib/phoenix_slime_web/templates/user/show.html.slime", fn file ->
        assert file =~ "strong Name:"
        assert file =~ "= @user.name"
      end)

      assert_file("test/phoenix_slime_web/controllers/user_controller_test.exs")

      assert_received {:mix_shell, :info, ["\nAdd the resource" <> _ = message]}
      assert message =~ ~s(resources "/users", UserController)
    end)
  end

  test "with --web namespace generates namespaced web modules and directories" do
    in_tmp("generates web resource", fn ->
      Gen.Html.Slime.run(~w(Blog Post posts title:string --web Blog))

      assert_file("test/phoenix_slime_web/controllers/blog/post_controller_test.exs")
      assert_file("lib/phoenix_slime_web/controllers/blog/post_controller.ex")

      assert_file("lib/phoenix_slime_web/templates/blog/post/form.html.slime")
      assert_file("lib/phoenix_slime_web/templates/blog/post/edit.html.slime")
      assert_file("lib/phoenix_slime_web/templates/blog/post/index.html.slime")
      assert_file("lib/phoenix_slime_web/templates/blog/post/new.html.slime")
      assert_file("lib/phoenix_slime_web/templates/blog/post/show.html.slime")

      assert_file("lib/phoenix_slime_web/views/blog/post_view.ex")
    end)
  end

  test "generates html resource without schema file" do
    in_tmp("generates html resource without schema", fn ->
      Gen.Html.Slime.run(~w(Admin User users --no-schema name:string))

      refute_file("lib/phoenix_slime/admin/user.ex")

      assert_file("lib/phoenix_slime_web/templates/user/form.html.slime", fn file ->
        refute file =~ ~s(--no-schema)
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

    test "generates files with .slim extension " do
      in_tmp("generates .slim", fn ->
        Mix.Tasks.Phx.Gen.Html.Slime.run(~w(Admin User users))

        assert_file("lib/phoenix_slime_web/templates/user/edit.html.slim")
        assert_file("lib/phoenix_slime_web/templates/user/form.html.slim")
        assert_file("lib/phoenix_slime_web/templates/user/index.html.slim")
        assert_file("lib/phoenix_slime_web/templates/user/new.html.slim")
        assert_file("lib/phoenix_slime_web/templates/user/show.html.slim")
      end)
    end
  end

  test "plural can't contain a colon" do
    assert_raise Mix.Error, fn ->
      Mix.Tasks.Phx.Gen.Html.Slime.run(["Blog", "Post", "title:string", "content:string"])
    end
  end

  test "plural can't have uppercased characters or camelized format" do
    assert_raise Mix.Error, fn ->
      Mix.Tasks.Phx.Gen.Html.Slime.run(["Blog", "User", "Users", "foo:string"])
    end

    assert_raise Mix.Error, fn ->
      Mix.Tasks.Phx.Gen.Html.Slime.run(["Admin", "User", "AdminUsers", "foo:string"])
    end
  end

  test "name is already defined" do
    assert_raise Mix.Error, fn ->
      Mix.Tasks.Phx.Gen.Html.Slime.run(["DupHTML", "duphtmls"])
    end
  end
end
