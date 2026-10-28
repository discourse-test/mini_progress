# frozen_string_literal: true

require_relative "lib/mini_progress/version"

Gem::Specification.new do |spec|
  spec.name = "mini_progress"
  spec.version = MiniProgress::VERSION
  spec.authors = ["Discourse Team"]

  spec.summary = "Step and progress reporting for command line tools"
  spec.description =
    "MiniProgress reports the steps of a command line run and their progress. On a terminal it " \
      "draws one live row per running step, while finished steps and notices scroll into the " \
      "terminal history. Pipes, CI logs and dumb terminals get plain lines instead."
  spec.homepage = "https://github.com/discourse-test/mini_progress"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4"

  spec.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com/discourse-test"
  spec.metadata["github_repo"] = "ssh://github.com/discourse-test/mini_progress"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir["lib/**/*.rb", "lib/**/*.yml", "LICENSE.txt"]
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 7.1"
  spec.add_dependency "i18n", ">= 1.8"
  spec.add_dependency "unicode-display_width", ">= 3.0"
end
