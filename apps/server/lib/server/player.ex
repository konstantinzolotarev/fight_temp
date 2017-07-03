defmodule Server.Player do
  use Ecto.Schema
  import Ecto.Changeset
  alias Server.Player


  schema "players" do
    field :age, :integer
    field :email, :string
    field :password, :string
    field :username, :string
    field :active, :boolean, default: false
    field :is_admin, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(%Player{} = player, attrs) do
    player
    |> cast(attrs, [:email, :username, :age, :password, :active])
    |> validate_required([:email, :username, :password])
  end
end
