defmodule Server.PlayerTest do
  use Server.DataCase

  alias Server.Player

  @valid_attrs %{
    age: 42,
    email: "konstantin@gmail.com",
    password: "test",
    username: "admin",
    active: true
  }

  test "changeset with valid attributes" do
    changeset = Player.changeset(%Player{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset without email" do
    changeset = Player.changeset(%Player{}, %{email: "kos@some.com"})
    refute changeset.valid?
  end

  test "changeset set default active" do
    data = Map.delete(@valid_attrs, :active)
    changeset = Player.changeset(%Player{}, data)
    assert changeset.valid?
  end

  test "check unique email" do
    %Player{}
    |> Player.changeset(@valid_attrs)
    |> Server.Repo.insert!
    player = Player.changeset(%Player{}, @valid_attrs)

    assert {:error, changeset} = Server.Repo.insert(player)
    IO.inspect changeset.errors[:email]
  end
end
