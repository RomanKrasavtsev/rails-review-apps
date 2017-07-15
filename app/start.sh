#!/bin/bash

mv /root/database.yml config
bundle install --without test developmen --deployment
bundle exec rake db:reset
bundle exec rake assets:precompile
bundle exec puma
