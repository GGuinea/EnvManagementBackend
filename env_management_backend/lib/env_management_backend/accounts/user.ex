defmodule EnvManagementBackend.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :role, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :role])
    |> validate_required([:name])
    |> update_change(:email, &String.downcase(&1))
    |> validate_length(:name, min: 6, max: 30)
    |> validate_format(:email, ~r/@/)
  end

end
