defmodule Journal.JournalTest do
  use Journal.DataCase

  alias Journal.Journal

  describe "entries" do
    alias Journal.Journal.Entry

    @valid_attrs %{date: "some date", message: "some message", title: "some title"}
    @update_attrs %{date: "some updated date", message: "some updated message", title: "some updated title"}
    @invalid_attrs %{date: nil, message: nil, title: nil}

    def entry_fixture(attrs \\ %{}) do
      {:ok, entry} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Journal.create_entry()

      entry
    end

    test "list_entries/0 returns all entries" do
      entry = entry_fixture()
      assert Journal.list_entries() == [entry]
    end

    test "get_entry!/1 returns the entry with given id" do
      entry = entry_fixture()
      assert Journal.get_entry!(entry.id) == entry
    end

    test "create_entry/1 with valid data creates a entry" do
      assert {:ok, %Entry{} = entry} = Journal.create_entry(@valid_attrs)
      assert entry.date == "some date"
      assert entry.message == "some message"
      assert entry.title == "some title"
    end

    test "create_entry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Journal.create_entry(@invalid_attrs)
    end

    test "update_entry/2 with valid data updates the entry" do
      entry = entry_fixture()
      assert {:ok, entry} = Journal.update_entry(entry, @update_attrs)
      assert %Entry{} = entry
      assert entry.date == "some updated date"
      assert entry.message == "some updated message"
      assert entry.title == "some updated title"
    end

    test "update_entry/2 with invalid data returns error changeset" do
      entry = entry_fixture()
      assert {:error, %Ecto.Changeset{}} = Journal.update_entry(entry, @invalid_attrs)
      assert entry == Journal.get_entry!(entry.id)
    end

    test "delete_entry/1 deletes the entry" do
      entry = entry_fixture()
      assert {:ok, %Entry{}} = Journal.delete_entry(entry)
      assert_raise Ecto.NoResultsError, fn -> Journal.get_entry!(entry.id) end
    end

    test "change_entry/1 returns a entry changeset" do
      entry = entry_fixture()
      assert %Ecto.Changeset{} = Journal.change_entry(entry)
    end
  end

  describe "images" do
    alias Journal.Journal.Image

    @valid_attrs %{caption: "some caption"}
    @update_attrs %{caption: "some updated caption"}
    @invalid_attrs %{caption: nil}

    def image_fixture(attrs \\ %{}) do
      {:ok, image} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Journal.create_image()

      image
    end

    test "list_images/0 returns all images" do
      image = image_fixture()
      assert Journal.list_images() == [image]
    end

    test "get_image!/1 returns the image with given id" do
      image = image_fixture()
      assert Journal.get_image!(image.id) == image
    end

    test "create_image/1 with valid data creates a image" do
      assert {:ok, %Image{} = image} = Journal.create_image(@valid_attrs)
      assert image.caption == "some caption"
    end

    test "create_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Journal.create_image(@invalid_attrs)
    end

    test "update_image/2 with valid data updates the image" do
      image = image_fixture()
      assert {:ok, image} = Journal.update_image(image, @update_attrs)
      assert %Image{} = image
      assert image.caption == "some updated caption"
    end

    test "update_image/2 with invalid data returns error changeset" do
      image = image_fixture()
      assert {:error, %Ecto.Changeset{}} = Journal.update_image(image, @invalid_attrs)
      assert image == Journal.get_image!(image.id)
    end

    test "delete_image/1 deletes the image" do
      image = image_fixture()
      assert {:ok, %Image{}} = Journal.delete_image(image)
      assert_raise Ecto.NoResultsError, fn -> Journal.get_image!(image.id) end
    end

    test "change_image/1 returns a image changeset" do
      image = image_fixture()
      assert %Ecto.Changeset{} = Journal.change_image(image)
    end
  end
end
