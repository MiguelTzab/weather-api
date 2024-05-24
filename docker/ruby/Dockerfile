FROM ruby:3.3.1-alpine

# Install essential dependencies for building native extensions and running Rails
RUN apk update && apk add --no-cache \
    build-base \
    libxml2-dev \
    libxslt-dev \
    tzdata \
    gmp-dev \
    libffi-dev \
    openssl-dev \
    libc-dev \
    shared-mime-info \
    nodejs \
    gcompat \
    musl

# Set the working directory
WORKDIR /application

COPY Gemfile* ./

RUN gem install bundler

RUN bundle install

COPY . .

RUN chmod +x docker/ruby/entrypoint.sh

EXPOSE 3000

CMD ["docker/ruby/entrypoint.sh"]