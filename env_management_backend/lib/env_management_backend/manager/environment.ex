defmodule EnvManagementBackend.Manager.Environment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "environments" do
    field :comments, :string
    field :destination, :string
    field :history, :string
    field :ip, :string
    field :location, :string
    field :name, :string
    field :relatedTo, :string
    field :reservedFor, :string
    field :reservedTill, :date
    field :type, :integer

    timestamps()
  end

  @doc false
  def changeset(environment, attrs) do
    environment
    |> cast(attrs, [:name, :location, :type, :ip, :reservedFor, :reservedTill, :destination, :relatedTo, :comments, :history])
    |> validate_required([:name, :location, :type, :ip, :reservedFor, :reservedTill, :destination, :relatedTo, :comments, :history])
  end
end
