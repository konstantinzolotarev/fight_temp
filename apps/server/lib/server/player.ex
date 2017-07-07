defmodule Server.Player do
  use Ecto.Schema
  import Ecto.Changeset
  alias Server.Player

  @required_fields ~w(email username)a
  @optional_fields ~w(age username active is_admin password password_hash)a

  schema "players" do
    field :age, :integer
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :username, :string
    field :active, :boolean, default: false
    field :is_admin, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(%Player{} = player, attrs) do
    player
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> hash_password()
    |> validate_required(@required_fields)
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> validate_length(:username, min: 3, max: 20)
    # |> validate_length(:password, min: 5, max: 20)
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ -> changeset
    end
  end
end
