defmodule Server.Repo.Migrations.CreateServer.Player do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :email, :string
      add :username, :string
      add :age, :integer
      add :password, :string
      add :active, :boolean, default: false

      timestamps()
    end

    unique_index(:players, [:email])
    unique_index(:players, [:username])
  end
end
