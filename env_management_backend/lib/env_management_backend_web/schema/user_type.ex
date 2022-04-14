defmodule EnvManagementBackendWeb.Schema.Types.Usertype do
  use Absinthe.Schema.Notation

  object :user_type do
    field(:id, :id)
    field(:name, :string)
    field(:email, :string)
    field(:role, :string)
  end

  input_object :user_input_type do
    field(:name, non_null(:string))
    field(:email, :string)
    field(:role, :string)
  end
end
