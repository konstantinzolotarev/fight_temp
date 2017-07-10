defmodule Server.PlayerTest do
  use Server.DataCase

  alias Server.Player

  @valid_attrs %{
    age: 42,
    email: Faker.Internet.email,
    password: Faker.Lorem.word,
    username: Faker.String.base64,
    active: true
  }

  test "changeset with valid attributes" do
    changeset = Player.changeset(%Player{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset without email" do
    changeset = Player.changeset(%Player{}, %{email: Faker.Internet.email})
    refute changeset.valid?
  end

  test "changeset set default active" do
    data = Map.delete(@valid_attrs, :active)
    %Ecto.Changeset{changes: changes} = Player.changeset(%Player{}, data)
    refute changes.password_hash == ""
  end

  test "hash password on change" do
    changeset = Player.changeset(%Player{}, @valid_attrs)
    assert changeset.valid?
  end

  test "check unique email" do
    %Player{}
    |> Player.changeset(@valid_attrs)
    |> Server.Repo.insert!
    player = Player.changeset(%Player{}, @valid_attrs)

    assert {:error, _changeset} = Server.Repo.insert(player)
  end

  test "check unique username" do
    player_data = %{@valid_attrs | email: Faker.Internet.email, username: Faker.String.base64}

    %Player{}
    |> Player.changeset(player_data)
    |> Server.Repo.insert!
    player = Player.changeset(%Player{}, player_data)

    assert {:error, _changeset} = Server.Repo.insert(player)
  end
end
