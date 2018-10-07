defmodule Journal do
	import Ecto.Query, warn: false
  alias Journal.Journal.Image
  alias Journal.Repo

  def get_images_by_entry_id(entry_id) do
    query = from i in Image, where: i.entry_id == ^entry_id, order_by: [i.id]
    Repo.all(query)
  end

  def format_date date do
  	date_enum = String.split date, "-"

  	month_int = get_date_int(date_enum, 1)
  	day_int = get_date_int(date_enum, 2)
  	year_int = get_date_int(date_enum, 0)
  	wday_int = {year_int, month_int, day_int} |> Date.from_erl! |> Date.day_of_week

  	month_name = get_month_name(month_int)
  	day_name = Integer.to_string(day_int)
  	year_name = Integer.to_string(year_int)
  	wday_name = get_wday_name(wday_int)

  	wday_name <> ", " <> month_name <> " " <> day_name <> ", " <> year_name
  end

  defp get_month_name(month_int) do
  	Enum.at(["January", "February", "March", "April",
  					 "May", "June", "July", "August",
  					 "September", "October", "November", "December"],
  					 month_int - 1)
  end

  defp get_wday_name(wday_int) do
  	Enum.at(["Monday", "Tuesday", "Wednesday",
  		       "Thursday", "Friday", "Saturday", "Sunday"],
  		       wday_int - 1)
  end

  defp get_date_int(date_enum, part_num) do
  	date_enum |> Enum.at(part_num) |> Integer.parse |> elem(0)
  end
end
