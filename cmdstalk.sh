#!/usr/bin/env bash

echo "Sleeping for 5..."
sleep 5

exec /usr/local/bin/cmdstalk "$@"
