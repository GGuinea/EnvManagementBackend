defmodule EnvManagementBackend.Repo do
  use Ecto.Repo,
    otp_app: :env_management_backend,
    adapter: Ecto.Adapters.Postgres
end
