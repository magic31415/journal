# Script for populating the database. You can run it as:
#
#     mix run priv/repo/change_dates.exs

import Ecto.Query, warn: false
alias Journal.Repo
alias Journal.Journal
alias Journal.Entry

entries = Journal.list_entries

Enum.each entries, fn entry ->
	if String.contains?(entry.date, "/") do
		[month, day, year] = String.split(entry.date, "/")
		entry |> Entry.changeset(%{date: "20#{year}-#{month}-#{day}"}) |> Repo.update
	end
end
