# frozen_string_literal: true

require "i18n"

require_relative "mini_progress/version"
require_relative "mini_progress/formatting"
require_relative "mini_progress/reporter"
require_relative "mini_progress/plain"
require_relative "mini_progress/tui"
require_relative "mini_progress/tui/ansi"
require_relative "mini_progress/tui/renderer"
require_relative "mini_progress/factory"

# Step and progress reporting for command line tools. Start with
# {MiniProgress::Factory.build}.
module MiniProgress
  LOCALE_FILES = Dir[File.expand_path("mini_progress/locales/*.yml", __dir__)].freeze

  # Adds the gem's translations to I18n. Runs when the gem is required and does
  # nothing the second time.
  def self.load_translations
    new_files = LOCALE_FILES - I18n.load_path
    return if new_files.empty?

    I18n.load_path.concat(new_files)
    # A backend that already loaded its translations (for example in a booted
    # Rails app) doesn't look at the load path again until it reloads.
    I18n.backend.load_translations(*new_files)
  end
end

MiniProgress.load_translations
