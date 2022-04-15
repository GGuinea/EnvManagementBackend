defmodule EnvManagementBackend.ManagerTest do
  use EnvManagementBackend.DataCase

  alias EnvManagementBackend.Manager

  describe "environments" do
    alias EnvManagementBackend.Manager.Environment

    import EnvManagementBackend.ManagerFixtures

    @invalid_attrs %{comments: nil, destination: nil, history: nil, ip: nil, location: nil, name: nil, relatedTo: nil, reservedFor: nil, reservedTill: nil, type: nil}

    test "list_environments/0 returns all environments" do
      environment = environment_fixture()
      assert Manager.list_environments() == [environment]
    end

    test "get_environment!/1 returns the environment with given id" do
      environment = environment_fixture()
      assert Manager.get_environment!(environment.id) == environment
    end

    test "create_environment/1 with valid data creates a environment" do
      valid_attrs = %{comments: "some comments", destination: "some destination", history: "some history", ip: "some ip", location: "some location", name: "some name", relatedTo: "some relatedTo", reservedFor: "some reservedFor", reservedTill: ~D[2022-04-14], type: 42}

      assert {:ok, %Environment{} = environment} = Manager.create_environment(valid_attrs)
      assert environment.comments == "some comments"
      assert environment.destination == "some destination"
      assert environment.history == "some history"
      assert environment.ip == "some ip"
      assert environment.location == "some location"
      assert environment.name == "some name"
      assert environment.relatedTo == "some relatedTo"
      assert environment.reservedFor == "some reservedFor"
      assert environment.reservedTill == ~D[2022-04-14]
      assert environment.type == 42
    end

    test "create_environment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manager.create_environment(@invalid_attrs)
    end

    test "update_environment/2 with valid data updates the environment" do
      environment = environment_fixture()
      update_attrs = %{comments: "some updated comments", destination: "some updated destination", history: "some updated history", ip: "some updated ip", location: "some updated location", name: "some updated name", relatedTo: "some updated relatedTo", reservedFor: "some updated reservedFor", reservedTill: ~D[2022-04-15], type: 43}

      assert {:ok, %Environment{} = environment} = Manager.update_environment(environment, update_attrs)
      assert environment.comments == "some updated comments"
      assert environment.destination == "some updated destination"
      assert environment.history == "some updated history"
      assert environment.ip == "some updated ip"
      assert environment.location == "some updated location"
      assert environment.name == "some updated name"
      assert environment.relatedTo == "some updated relatedTo"
      assert environment.reservedFor == "some updated reservedFor"
      assert environment.reservedTill == ~D[2022-04-15]
      assert environment.type == 43
    end

    test "update_environment/2 with invalid data returns error changeset" do
      environment = environment_fixture()
      assert {:error, %Ecto.Changeset{}} = Manager.update_environment(environment, @invalid_attrs)
      assert environment == Manager.get_environment!(environment.id)
    end

    test "delete_environment/1 deletes the environment" do
      environment = environment_fixture()
      assert {:ok, %Environment{}} = Manager.delete_environment(environment)
      assert_raise Ecto.NoResultsError, fn -> Manager.get_environment!(environment.id) end
    end

    test "change_environment/1 returns a environment changeset" do
      environment = environment_fixture()
      assert %Ecto.Changeset{} = Manager.change_environment(environment)
    end
  end
end
