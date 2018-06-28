# Script for adding a new entry the database. You can run it as:
#
#     mix run priv/repo/new_entry.exs

Journal.add_entry("Packing Up", "Today I spent the day deciding what to bring and packing up. Lots of stuff to choose from but most of it I do not need.", "06/28/18")

Journal.add_image("Some of the suitcases I'm bringing")

Journal.get_image_numbers(1)
