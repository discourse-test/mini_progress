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
end
