# Make sure it matches the Ruby version in .ruby-version and Gemfile
FROM ruby:3.2.2

# Install PostgreSQL client libraries and headers
RUN apt-get update && \
    apt-get install -y -V postgresql-client libpq-dev

# Rails app lives here
WORKDIR /app

ENV PGUSER myuser

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

# Copy application code
COPY . .

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD  ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]