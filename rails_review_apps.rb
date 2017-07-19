#!/usr/bin/env ruby

GIT_URL = ENV[REVIEW_APPS_GIT_URL]
RAILS_ENV = ENV[REVIEW_APPS_RAILS_ENV]
SECRET_KEY_BASE = ENV[REVIEW_APPS_SECRET_KEY_BASE]
DOMAIN=ENV[REVIEW_APPS_DOMAIN]

COMMAND = ARGV[0]
BRANCH = ARGV[1]

if GIT_URL && RAILS_ENV && DOMAIN
  if COMMAND == "up" && BRANCH
    %x[rm -rf branches/#{BRANCH}]
    %x[mkdir branches/#{BRANCH}]
    %x[git clone #{GIT_URL} branches/#{BRANCH}/]
    %x[cd branches/#{BRANCH} && git checkout #{BRANCH}]
    %x[cp review_apps_docker_compose.yml branches/#{BRANCH}/docker-compose.yml]
    %x[echo "SECRET_KEY_BASE=#{SECRET_KEY_BASE}" > branches/#{BRANCH}/.env] if SECRET_KEY_BASE
    %x[echo "BRANCH=#{BRANCH}" >> branches/#{BRANCH}/.env]
    %x[echo "RAILS_ENV=#{RAILS_ENV}" >> branches/#{BRANCH}/.env]
    %x[echo "RACK_ENV=#{RAILS_ENV}" >> branches/#{BRANCH}/.env]
    %x[echo "VIRTUAL_HOST=#{BRANCH}.#{DOMAIN}" >> branches/#{BRANCH}/.env]
    %x[cd branches/#{BRANCH} && docker-compose -p #{BRANCH} up -d]
  elsif COMMAND == "down"
    %x[cd branches/#{BRANCH} && docker-compose -p #{BRANCH} down]
  elsif COMMAND == "--help"
    puts "Usage: rails_review_app.rb up|down branch"
    puts "  up - create review app"
    puts "  down - delete review app"
    puts "  branch - Branch name"
    puts ""
    puts "Environment variables:"
    puts "  REVIEW_APPS_GIT_URL - SSH URL to Git repository"
    puts "  REVIEW_APPS_RAILS_ENV - The Rails environment"

    puts "Optional environment variable:"
    puts "  REVIEW_APPS_SECRET_KEY_BASE - The secret key used by Devise to generate random tokens"
  else
    puts "Unsupported command."
    puts "See 'rails_review_app.rb --help'"
  end
else
  puts "Set environment variables REVIEW_APPS_GIT_URL, REVIEW_APPS_RAILS_ENV, REVIEW_APPS_DOMAIN"
end
