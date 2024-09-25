#!/bin/sh

# Check if the environment variables are set
if [ -z "$DOMAIN" ] && [ -z "$PSW" ]; then
  echo "Both domain and psw are not set. Using default config."
else
  # Update the config.txt file with the environment variable values
  jq --arg val1 "$DOMAIN" --arg val2 "$PSW" \
    '.domain = $val1 | .psw = $val2' config.txt > temp.json && mv temp.json config.txt
  echo "Updated config.txt with domain: $DOMAIN and psw: $PSW"
fi

# Start the Node.js application
node cli.js  # Adjust this command based on how to start your application
