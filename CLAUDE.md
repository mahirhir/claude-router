# Project rules

- This repository is public: never commit API keys, OAuth data, account identifiers, machine usernames, or absolute user paths.
- Keep runtime secrets in `config.local.json`, which is gitignored; examples must use obvious placeholders.
- Scripts must preserve unrelated Claude Code and VSCode settings and create a backup before mutation.
- Tests must use temporary settings/config paths and must not change the real user profile.
- Support Windows PowerShell 5.1 unless a file explicitly documents a newer requirement.
- Remote: `https://github.com/vinhnguyenthanhdn/claude-router` (public, default branch `main`).
