# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Journal.Repo.insert!(%Journal.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Journal.Repo
alias Journal.Journal.Entry
alias Journal.Journal.Image

Repo.delete_all(Entry)
Repo.delete_all(Image)
