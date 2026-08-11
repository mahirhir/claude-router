# Contributing

Thank you for helping improve Claude Router Switcher. Contributions may include code, tests, documentation, provider compatibility reports, and reproducible bug reports.

## Before opening an issue

- Search existing issues and discussions.
- Confirm whether the problem belongs to this toolkit, 9Router, Claude Code, or the upstream model provider.
- Remove API keys, OAuth data, email addresses, account IDs, usernames, private source code, and internal URLs from logs and screenshots.
- Use the appropriate issue form. Provider results belong in the provider compatibility form.

Security vulnerabilities and leaked credentials must not be reported in a public issue. Follow [SECURITY.md](SECURITY.md).

## Development setup

Requirements:

- Windows 10/11
- Windows PowerShell 5.1 or later
- Git

Clone your fork, then run the isolated test suite:

```powershell
powershell -ExecutionPolicy Bypass -File .\tests\run-tests.ps1
```

The tests use temporary directories and must never mutate real Claude Code or VSCode settings.

## Design rules

- Keep the toolkit provider-independent. Provider and model IDs belong in `config.local.json`, not in runtime scripts.
- Support Windows PowerShell 5.1 unless a change explicitly raises the documented minimum version.
- Preserve unrelated properties in VSCode `settings.json`.
- Preserve unrelated entries in `claudeCode.environmentVariables`.
- Back up a settings file before changing it and restore it after a failed write.
- Never print authentication tokens in status output, errors, tests, screenshots, or logs.
- Keep secrets in `config.local.json`; this file must remain ignored by Git.
- Prefer small, focused pull requests with tests.

## Pull request workflow

1. Create a branch from the default branch.
2. Add or update tests for behavioral changes.
3. Run `tests/run-tests.ps1` locally.
4. Check that no local config, backup, token, account data, or absolute user path is included.
5. Update README/setup/provider documentation when behavior changes.
6. Open a pull request using the provided template.

A maintainer may ask you to split unrelated changes. A passing CI run is required, but does not replace review.

## Provider compatibility contributions

Provider support is model-specific and version-specific. To add a result to [docs/PROVIDERS.md](docs/PROVIDERS.md):

- test the exact provider and model ID through Claude Code;
- record the 9Router version;
- test basic streaming and, where applicable, tool use, vision, thinking, and prompt caching;
- use `Yes`, `No`, `Partial`, or `Not tested` rather than guessing;
- include only sanitized evidence;
- do not imply that presence in the 9Router dashboard guarantees compatibility.

## Documentation style

- Use concise, objective English.
- Write reusable instructions rather than machine-specific history.
- Use placeholders for keys, usernames, endpoints, and account IDs.
- Link to official upstream documentation where possible.

## Recognition

Contributors are credited through Git history, pull requests, compatibility tables, and release notes. Consistent contributors may be invited to help triage or maintain areas they know well.
