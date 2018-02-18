FROM approva/ruby:2.4.1

# create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# install app dependencies
COPY . /usr/src/app/

RUN apk add --update --virtual .rails-builddeps \
  build-base \
  && apk add --update sqlite-dev \
  && bundle install --no-cache --clean --without development test \
  && apk del .rails-builddeps

EXPOSE 8080

CMD [ "bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "8080" ]
