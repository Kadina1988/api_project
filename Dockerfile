FROM ruby:3.0 

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    curl \
    less \
    libpq-dev \
    postgresql-client

RUN gem install bundler 

WORKDIR /app 

COPY Gemfile Gemfile.lock ./  

RUN bundle install 

COPY . ./ 

CMD ["rails", "server", "-b", "0.0.0.0"]

