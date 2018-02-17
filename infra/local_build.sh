#!/usr/bin/env bash
set -x
set -e
set -o pipefail

function build_ruby() {
  IMAGE_NAME="approva/ruby:2.4.1"

  docker build -f infra/ruby/Dockerfile -t ${IMAGE_NAME} .
}

function build_rails_app() {
  build_image="payment-platform-gateway"
  custom_log_path="/var/log/service.log"

  docker build -f infra/app/Dockerfile -t $build_image .
}

#script steps
build_ruby
