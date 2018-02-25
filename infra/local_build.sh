#!/usr/bin/env bash
set -x
set -e
set -o pipefail

build_image="approva-app"
dev_build_image="${build_image}-dev"

function build_rails_app() {
  echo "## Building App Image ##\n\n"
  docker build -f infra/dev/Dockerfile -t ${dev_build_image} .
  echo "\n## Finished building App image##\n\n"
}

function run_docker_rails_app() {
  echo "## Running rails application ## \n\n"
  custom_log_path="/var/log/service.log"

  docker run -d -p 3001:3000 \
            --rm \
            --env CUSTOM_LOG_PATH=$custom_log_path \
            $dev_build_image
}

function run_rails_app() {
  export RAILS_ENV=development
  gem install bundle
  bundle exec rails db:create db:migrate
  rails s
}

printf "\nExecutar com docker (d) ou normalmente com rails (r)? [d/r]: "

read -r continue

if [[ $continue =~ ^[d]$ ]] ; then
  build_rails_app
  run_docker_rails_app
else
  run_rails_app
fi
