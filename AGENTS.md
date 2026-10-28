# AGENTS.md

Step and progress reporting for command line tools: a reporter that steps report to, a TUI renderer for terminals (one live row per running step, finished steps and notices scroll into the history) and a plain line renderer for pipes, CI and dumb terminals.

## Commands

- `bin/rspec`: run the specs
- `bin/lint`: autocorrect with RuboCop and format with Syntax Tree
- `bin/rubocop`, `bin/stree check Gemfile Rakefile '*.gemspec' '**/*.rb'`: check without changing files

## Conventions

- Comments explain why, not what. No comments that describe history or code that was removed.
- No `module_function`, no endless methods, no `send`/`public_send` (RuboCop enforces this).
- Prefer `> 0` / `< 0` over `.positive?` / `.negative?`.
- Commit messages use Discourse's prefixes (`DEV:`, `FIX:`, `FEATURE:`, `PERF:`, `UX:`). Don't reference PRs, issues or commits of other repositories in commit messages or PR descriptions.
