#!/bin/bash

# Remove the temporary server.pid file if it exists
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Copy .env.example to .env if it doesn't exist
if [ ! -f .env ]; then
  cp .env.example .env
fi

# Install gems if needed
bundle check || bundle install

# Precompile assets if needed
bundle exec rails assets:precompile

# Run database migrations
bundle exec rails db:migrate

# Start the Rails server and keep it running
bundle exec rails server -b 0.0.0.0
