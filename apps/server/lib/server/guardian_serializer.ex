defmodule Server.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Server.Repo
  alias Server.Player

  def for_token(player = %Player{}), do: { :ok, "Player: #{player.id}" }
  def for_token(_), do: { :error, "Unknown resource type" }

  def from_token("Player:" <> id), do: { :ok, Repo.get(Player, id) }
  def from_token(_), do: { :error, "Unknown resource type" }
end
