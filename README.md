# MiniProgress

Step and progress reporting for command line tools.

A run is split into steps, and each step reports its progress to a reporter. On a terminal, MiniProgress draws one live row per running step with its percent, count, elapsed time, ETA and rate. Finished steps and notices scroll up into the normal terminal history. For pipes, CI logs and dumb terminals it prints plain lines instead, without any cursor movement or colors.

Progress can be reported from several threads at once, and steps can run at the same time.

## Installation

Add the gem to your Gemfile:

```ruby
gem "mini_progress"
```

Then run `bundle install`.

## Usage

```ruby
require "mini_progress"

titles = ["Users", "Posts"]
reporter = MiniProgress::Factory.build(titles:)

begin
  users = reporter.start_step("Users")
  begin
    users.with_progress(max_progress: 1_000) do |progress|
      1_000.times { progress.update(increment_by: 1) }
    end
  ensure
    users.finish
  end

  posts = reporter.start_step("Posts")
  begin
    posts.notice("Skipping deleted posts")
    posts.with_progress(max_progress: nil) do |progress|
      progress.update(increment_by: 500, skip_count: 3, warning_count: 1)
    end
  ensure
    posts.finish
  end

  reporter.report_summary(runtime: 12.5, total: 2, failed: 0, skipped: 0)
ensure
  reporter.close
end
```

- `Factory.build(output: $stdout, titles: [])` returns the TUI reporter when `output` is a terminal and the plain one otherwise. Set `TERM=dumb` to force plain output. `titles` is optional and lets the TUI size its title column up front.
- `start_step(title)` returns a handle for the step. Use `with_progress` (or `begin_progress`) with `max_progress: nil` when the total isn't known.
- `finish` in an `ensure` tells from the exception in flight whether the step finished, failed or was interrupted. Pass `outcome: :done`, `:failed` or `:interrupted` to set it yourself.
- `finalizing { ... }` shows a "Finishing up…" status while background work completes after the last step.
- Call `close` once at the end of the run, also when it fails, so the terminal gets its cursor back.

Set `NO_COLOR` to turn off colors in the TUI.

### Translations

The texts are translated with `i18n`. Requiring the gem adds its English locale file to `I18n.load_path`; the keys live under `mini_progress.*`.

## Development

```bash
bin/setup     # install dependencies
bin/rspec     # run the specs
bin/lint      # autocorrect with RuboCop and format with Syntax Tree
bin/console   # an IRB session with the gem loaded
```

To check without changing files, run `bundle exec rubocop` and `bundle exec stree check Gemfile Rakefile '*.gemspec' '**/*.rb'`.

## License

The gem is available under the terms of the [MIT License](LICENSE.txt).
