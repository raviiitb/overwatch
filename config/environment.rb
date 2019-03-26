# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

CONFIG = YAML.load_file("#{Rails.root}/config/common.yml")
