defmodule JournalWeb.EntryController do
  use JournalWeb, :controller

  alias Journal.Journal
  alias Journal.Entry

  # def index(conn, _params) do
  #   entries = Journal.list_entries()
  #   render(conn, "index.html", entries: entries)
  # end

  def date() do
    DateTime.utc_now() |> DateTime.to_date() |> Date.add(-1)
  end

  def new(conn, _params) do
    changeset = Journal.change_entry(%Entry{})
    render(conn, "new.html", changeset: changeset, date: date())
  end

  def create(conn, %{"entry" => entry_params}) do
    correct_code = Application.get_env(:journal, :code)
    entered_code = entry_params |> Map.get("code")

    if correct_code != "" && correct_code == entered_code do
      Application.put_env(:journal, :code, "")

      captions = entry_params |> Map.get("captions") |> String.split("\r\n")
      entry_params = entry_params |> Map.drop(["captions", "code"])
      case Journal.create_entry(entry_params) do
        {:ok, entry} ->
          for caption <- captions do
           Journal.add_image(caption)
          end

          conn
          |> put_flash(:info, "Entry created successfully.")
          |> redirect(to: page_path(conn, :index))
        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "new.html", changeset: changeset, date: date())
      end
    else
      Application.put_env(:journal, :code, "")

      conn
      |> put_flash(:error, "Whoops! Something went wrong.")
      |> redirect(to: entry_path(conn, :new))
    end
  end

  # def show(conn, %{"id" => id}) do
  #   entry = Journal.get_entry!(id)
  #   render(conn, "show.html", entry: entry)
  # end

  # def edit(conn, %{"id" => id}) do
  #   entry = Journal.get_entry!(id)
  #   changeset = Journal.change_entry(entry)
  #   render(conn, "edit.html", entry: entry, changeset: changeset)
  # end

  # def update(conn, %{"id" => id, "entry" => entry_params}) do
  #   entry = Journal.get_entry!(id)

  #   case Journal.update_entry(entry, entry_params) do
  #     {:ok, entry} ->
  #       conn
  #       |> put_flash(:info, "Entry updated successfully.")
  #       |> redirect(to: page_path(conn, :index))
  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "edit.html", entry: entry, changeset: changeset)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   entry = Journal.get_entry!(id)
  #   {:ok, _entry} = Journal.delete_entry(entry)

  #   conn
  #   |> put_flash(:info, "Entry deleted successfully.")
  #   |> redirect(to: page_path(conn, :index))
  # end
end
