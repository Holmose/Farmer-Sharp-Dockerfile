#!/bin/bash

if [ -d "/share/" ]; then
  echo "Directory 'share' exists."
  cp -f /share/Settings.json /app/
  echo "Settings.json file is successfully replaced."
else
  echo "Directory 'share' does not exist."
fi

exec "$@"
