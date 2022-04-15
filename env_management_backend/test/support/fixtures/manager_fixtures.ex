defmodule EnvManagementBackend.ManagerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EnvManagementBackend.Manager` context.
  """

  @doc """
  Generate a environment.
  """
  def environment_fixture(attrs \\ %{}) do
    {:ok, environment} =
      attrs
      |> Enum.into(%{
        comments: "some comments",
        destination: "some destination",
        history: "some history",
        ip: "some ip",
        location: "some location",
        name: "some name",
        relatedTo: "some relatedTo",
        reservedFor: "some reservedFor",
        reservedTill: ~D[2022-04-14],
        type: 42
      })
      |> EnvManagementBackend.Manager.create_environment()

    environment
  end
end
