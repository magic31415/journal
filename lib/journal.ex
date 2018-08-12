defmodule Journal do
	import Ecto.Query, warn: false
  alias Journal.Repo
  alias Journal.Journal.Entry
  alias Journal.Journal.Image

  def add_entry(title, message, date) do
  	Repo.insert! %Entry{title: title, message: message, date: date}
  end

  def add_image(caption) do
  	Repo.insert! %Image{caption: caption, journal_entry: Journal.list_entries |> Enum.at(0)}
		# IO.puts "---Go Add Image ##{Enum.at(Journal.list_images, 0).id}---"
  end

  def get_image_numbers(count) do
  	last = Enum.at(Journal.list_images, 0).id
  	first = last - count + 1

  	IO.puts "scp "
  	        <> ((for n <- first..last, do: "#{n}.jpg") |> Enum.join(" "))
  	        <> " max@45.76.167.75:~/www/maxcorwin/homepage/images"
  end

  def list_entries do
    query = from e in Entry, order_by: [desc: e.inserted_at]
    Repo.all(query)
  end

  def list_images do
    query = from i in Image, order_by: [desc: i.inserted_at]
    Repo.all(query)
  end

  def format_date date do
  	separated = String.split date, "/"
  	months = ["January", "February", "March", "April",
  					  "May", "June", "July", "August",
  					  "September", "October", "November", "December"]

  	month = (separated |> Enum.at(0) |> Integer.parse |> elem(0)) - 1

  	Enum.at(months, month) <> " " <> Enum.at(separated, 1) <> ", 20" <> Enum.at(separated, 2)
  end

  def get_images_by_entry_id(entry_id) do
  	query = from i in Image, where: i.journal_entry_id == ^entry_id, order_by: [i.id]
  	Repo.all(query)
  end
end
