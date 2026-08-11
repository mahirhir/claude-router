# Launch and growth roadmap

The repository is published at <https://github.com/vinhnguyenthanhdn/claude-router>. The items below require GitHub UI actions, external publishing, or post-launch activity.

## Before the first public release

### Repository settings

Configure these in GitHub:

- **Description:** `Switch Claude Code between Anthropic and any 9Router provider on Windows — terminal and VSCode support.`
- **Topics:** `claude-code`, `claude`, `anthropic`, `9router`, `llm-router`, `ai-router`, `model-router`, `openai`, `gemini`, `deepseek`, `vscode`, `powershell`, `windows`, `developer-tools`, `ai-tools`.
- Enable **Issues** and **Discussions**.
- Enable **Private vulnerability reporting**.
- Upload `docs/social-preview.png` under **Settings → General → Social preview**.
- Keep the Wiki disabled unless it will be maintained as the single documentation source.

### Screenshot review

Whenever a screenshot is added or replaced, inspect it at full resolution and confirm it contains no:

- API key or token;
- email address, account ID, or OAuth identity;
- machine username or private absolute path;
- internal project/source content;
- private prompt or conversation context.

Replace the image with a redacted version if any private information is visible. Automated text scans do not inspect pixels.

### CI and branch protection

After the first default-branch commit:

- confirm `.github/workflows/test.yml` passes on `windows-latest`;
- enable branch protection/rulesets;
- require the `windows-powershell` status check;
- require pull request review before merge;
- block force pushes and branch deletion on the default branch;
- enable GitHub secret scanning and push protection when available.

### Initial issues

Create real, scoped starter issues and apply `good first issue` only where a new contributor can complete the work independently. Candidates:

1. Add PowerShell argument-completion documentation.
2. Add a sanitized Windows Terminal installation screenshot.
3. Add a custom config-path example test.
4. Add VSCode Insiders settings-path support.
5. Add a Windows Sandbox verification guide.
6. Improve JSON validation error tests.
7. Add Pester coverage while retaining the no-dependency test runner.
8. Add the first verified provider compatibility result.

Use `help wanted` for larger tasks:

- macOS/Linux launchers;
- VSCodium/VSCode Insiders automatic detection;
- Scoop or Winget packaging;
- signed release assets;
- provider compatibility automation.

Each issue should state context, expected result, likely files, test instructions, and non-goals.

## First release (P1)

### Release `v0.1.0`

Prepare a release only after CI is green:

- tag `v0.1.0`;
- update placeholder links in `CHANGELOG.md`;
- include a ZIP without `config.local.json`, backups, logs, or test output;
- publish SHA-256 checksums;
- describe terminal switching, VSCode switching, config-driven provider support, backups, tests, limitations, and supported Windows/PowerShell versions.

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
