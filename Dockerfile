# Use the official Ruby 2.7.1 image as the base image
FROM ruby:2.7.1

# Install system dependencies required for Rails
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Create a working directory for your application inside the container
WORKDIR /app

# Install Rails
RUN gem install rails -v 5.2

# Create a new Rails application in the working directory
RUN rails new . --force --no-deps --skip-bundle

# Install required gems
RUN bundle install

# Expose port 3000 to access your Rails application from outside
EXPOSE 3000

# Configure the container's startup command
CMD ["rails", "server", "-b", "0.0.0.0"]



