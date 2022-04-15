defmodule EnvManagementBackend.Repo.Migrations.CreateEnvironments do
  use Ecto.Migration

  def change do
    create table(:environments) do
      add :name, :string
      add :location, :string
      add :type, :integer
      add :ip, :string
      add :reservedFor, :string
      add :reservedTill, :date
      add :destination, :string
      add :relatedTo, :string
      add :comments, :string
      add :history, :string

      timestamps()
    end
  end
end
