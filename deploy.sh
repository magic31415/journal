#!/bin/bash

# Influenced by the nu_mart deploy script and deployment lecture notes

echo "Beginning Deploy"

git pull
mix deps.get
mix ecto.migrate

(cd assets && npm install)
(cd assets && ./node_modules/brunch/bin/brunch b -p)

mix release.init
mix phx.digest
mix release --env=prod

rm -rf ../release_journal
mkdir ../release_journal
cp _build/prod/rel/journal/releases/0.0.1/journal.tar.gz ../release_journal

cd ../release_journal
tar xzvf journal.tar.gz

./bin/journal stop || true
PORT=8003 ./bin/journal start
