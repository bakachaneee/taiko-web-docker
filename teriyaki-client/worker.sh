#!/bin/bash

wait-for-it -h "$DB_HOST" -p "$DB_PORT"
size=$(curl https://teriyaki-server.lolichanx.repl.co | jq -r "length")
for id in $(seq "$size"); do
    curl -f -o "$id.json" "https://teriyaki-server.lolichanx.repl.co/db/$id.json"
    mongoimport --uri "mongodb://$DB_HOST:$DB_PORT" --file "$id.json" --db taiko --collection songs
done
