#!/bin/sh

set -e

# latest version of bundler
gem install bundler --no-document

# install gems
bundle check || bundle install

# wait for ldap server to be ready
sleep $WAIT

# prepare the test server
bundle exec rake ldap:modify

exec bundle exec "$@"
