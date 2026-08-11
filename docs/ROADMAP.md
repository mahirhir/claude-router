# Launch and growth roadmap

The repository is published at <https://github.com/vinhnguyenthanhdn/claude-router>. The items below require GitHub UI actions, external publishing, or post-launch activity.

## Open repository configuration

### Repository settings

Description, topics, Issues, Discussions, secret scanning with push protection, private vulnerability reporting, and the social preview image are configured. Keep the Wiki disabled unless it will be maintained as the single documentation source.

Re-upload `docs/social-preview.png` under **Settings → General → Social preview** whenever that image changes; there is no API for it.

### Screenshot review

Whenever a screenshot is added or replaced, inspect it at full resolution and confirm it contains no:

- API key or token;
- email address, account ID, or OAuth identity;
- machine username or private absolute path;
- internal project/source content;
- private prompt or conversation context.

Replace the image with a redacted version if any private information is visible. Automated text scans do not inspect pixels.

### Branch protection

`main` requires the `windows-powershell` status check and blocks force pushes and branch deletion. Pull-request review is not required while there is a single maintainer; enable it once a second maintainer or regular outside contributors exist.

### Issue backlog

Starter issues are open and labelled. Apply `good first issue` only where a new contributor can finish the work independently, and `help wanted` for larger tasks such as macOS/Linux launchers, VSCodium detection, packaging, signed release assets, and provider compatibility automation. Each issue should state context, expected result, likely files, test instructions, and non-goals.

## Launch (P1)

Release `v0.1.0` is published from the green CI commit. Optional additions: a ZIP that excludes `config.local.json`, backups, logs, and test output, with published SHA-256 checksums.

### Launch materials

Create a short, fully redacted 8–15 second GIF showing:

1. direct mode status;
2. `vscode-switch.ps1 on`;
3. VSCode reload;
4. a routed request visible in the sanitized 9Router console;
5. `off` returning to the default environment.

Write launch posts around the user problem and technical safeguards rather than asking for stars. Suggested angle:

> Switch Claude Code between Anthropic and any model exposed by 9Router without permanently changing global settings. Includes terminal and VSCode modes, local-only secrets, backups, install/uninstall, and Windows CI.

Potential channels, subject to their rules:

- the 9Router community or showcase area;
- Claude Code community channels;
- relevant awesome-Claude-Code lists through a normal pull request;
- developer forums and subreddits that allow project showcases;
- a technical article on Dev.to, Hashnode, or a personal blog;
- Show HN when there is a useful technical story and working release.

Do not cross-post identical promotional text at high volume.

## Post-launch improvements (P2)

- Grow `docs/PROVIDERS.md` using exact, versioned, sanitized community results.
- Credit compatibility contributors in the matrix and release notes.
- Add macOS/Linux support without weakening Windows behavior.
- Publish Scoop/Winget packages.
- Add a version command and safe update mechanism.
- Add link checking and PSScriptAnalyzer after agreeing on stable rules.
- Consider signed PowerShell scripts and release archives.
- Add anonymous, opt-in documentation feedback only if it has a clear privacy policy; do not add product telemetry by default.

## Maintainer operating practice

Target sustainable response times rather than promising instant support:

- acknowledge issues and pull requests within 48 hours when possible;
- triage reproducible reports within several days;
- review small pull requests within one week;
- explain declined changes respectfully and concretely;
- invite contributors to submit small fixes instead of silently implementing every suggestion;
- recognize contributors in releases;
- document decisions publicly in issues/discussions.

If maintainer availability changes, update `SUPPORT.md` and repository expectations.

## Success measures

Track useful adoption rather than stars alone:

- successful installations and resolved setup reports;
- provider compatibility contributions;
- first-time contributors who return;
- issue response and pull-request merge time;
- documentation search/referral terms;
- release downloads and discussion quality;
- ratio of actionable reports to incomplete/support-misdirected reports.

Stars are a discovery signal, not the project goal. A trustworthy project with repeat users and contributors compounds reach more reliably.
