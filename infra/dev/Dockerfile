FROM ruby:2.4.3-alpine

# create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app/

ENV RAILS_ENV=docker

RUN apk add --update build-base
RUN apk add --update sqlite-dev

RUN bundle install --no-cache --clean --without production test \

RUN bundle exec rails db:create && rails db:migrate

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
