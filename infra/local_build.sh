#!/usr/bin/env bash
set -x
set -e
set -o pipefail

build_image="approva-app"

function build_ruby() {
  echo "\n\n## Building Ruby image ## \n"
  IMAGE_NAME="approva/ruby:2.4.1"

  docker build -f infra/ruby/Dockerfile -t ${IMAGE_NAME} .
  echo "\n## Finished building ruby image##\n\n"
}

function build_rails_app() {
  echo "## Building App Image ##\n\n"
  docker build -f infra/app/Dockerfile -t ${build_image} .
  echo "\n## Finished building App image##\n\n"
}

function run_rails_app() {
  echo "## Running rails application ## \n\n"
  custom_log_path="/var/log/service.log"

  docker run -d -p 8080:8080 \
            --rm \
            --env CUSTOM_LOG_PATH=$custom_log_path \
            $build_image
}

#script steps
build_ruby
build_rails_app
run_rails_app
