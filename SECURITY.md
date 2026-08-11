# Security Policy

## Supported versions

Security fixes are provided for the latest released version and the current default branch. Older versions may be asked to upgrade before a fix is developed.

## Reporting a vulnerability

Do not open a public issue for:

- leaked API keys, OAuth tokens, cookies, or account identifiers;
- a way to expose secrets from configuration, process output, logs, backups, or screenshots;
- unsafe modification or restoration of VSCode/Claude Code settings;
- command or argument injection in launcher/install scripts;
- path traversal or arbitrary file overwrite/removal.

Report vulnerabilities privately through [GitHub private vulnerability reporting](https://github.com/vinhnguyenthanhdn/claude-router/security/advisories/new), or by email to <vinh.nguyenthanhdn@gmail.com> if that channel is unavailable. Do not open a public issue for a vulnerability.

Include:

- affected version or commit;
- Windows and PowerShell versions;
- reproduction steps using placeholder credentials;
- impact and affected files;
- a proposed fix, if available.

Never include a real secret. If a real key was exposed, revoke or rotate it immediately; do not wait for a software fix.

## Response process

A maintainer should acknowledge a report within 72 hours, assess severity, coordinate a fix and disclosure timeline, and credit the reporter unless anonymity is requested. Timelines may vary with severity and maintainer availability.

## Secret handling

- `config.local.json` is intentionally ignored by Git.
- Backups can contain keys and must remain local.
- Status output must redact authentication tokens.
- CI scans repository content for common local-secret and machine-identity patterns.
- Provider credentials remain the user's responsibility and are governed by provider terms.

## Out of scope

- vulnerabilities in 9Router, Claude Code, VSCode, or upstream providers;
- account bans or restrictions caused by violating provider terms;
- attacks requiring prior control of the user's Windows account;
- secrets intentionally committed by a downstream fork after removing ignore rules.

Report upstream vulnerabilities to the affected project or provider.
