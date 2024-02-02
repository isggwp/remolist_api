#!/bin/bash

# Set the Rails environment
export RAILS_ENV=test

# Run RSpec with desired options
bundle exec rspec --format documentation  --color "$@"
