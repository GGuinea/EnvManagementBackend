defmodule EnvManagementBackendWeb.Resolvers.UserResolver do
  alias EnvManagementBackend.Accounts

  def users(_,_,_) do
    {:ok, Accounts.list_users()}
  end
end
