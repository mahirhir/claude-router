# Provider compatibility matrix

Claude Router Switcher is provider-independent: it passes model IDs from local configuration to the Anthropic-compatible endpoint exposed by 9Router. Actual compatibility depends on the 9Router version, provider adapter, authentication method, and exact model.

Presence in the 9Router dashboard is not a compatibility guarantee.

## Verified results

No public compatibility results have been accepted yet. The initial local Codex test was intentionally not copied because a public matrix should contain reproducible, sanitized evidence rather than machine/account-specific claims.

| Provider | Exact model ID | Auth | Streaming | Tools | Vision | Thinking | Cache | 9Router version | Evidence |
|---|---|---|---:|---:|---:|---:|---:|---|---|
| _Contributions welcome_ | — | — | — | — | — | — | — | — | [Report a result](../.github/ISSUE_TEMPLATE/provider_compatibility.yml) |

## Result vocabulary

- **Yes:** tested successfully through Claude Code and 9Router.
- **No:** tested and did not work.
- **Partial:** basic behavior works with documented limitations.
- **Not tested:** no claim was made.
- **Unknown:** behavior could not be confirmed from observable output.
- **Not applicable:** the provider/model does not offer the feature.

## Minimum test procedure

1. Record the 9Router version and exact model ID shown by the dashboard.
2. Start Claude Code through `claude-9router` or enable the VSCode switcher.
3. Verify a basic streamed response.
4. Ask Claude Code to use a harmless read-only tool and confirm the complete tool-call round trip.
5. Test vision, thinking/reasoning, and caching only when exposed by the model/router.
6. Confirm the request and selected model in a sanitized 9Router console log.
7. Submit the provider compatibility issue form, with no credentials or private prompts.

## Provider catalog snapshot

The following integrations appeared in 9Router v0.5.50. This list is for discovery only; consult the dashboard installed on your machine.

### Custom endpoints

- Anthropic-compatible
- OpenAI-compatible

### OAuth integrations

Claude Code, Antigravity, OpenAI Codex, Qoder, GitHub Copilot, Cursor IDE, Kilo Code, Cline, ClinePass, CodeBuddy, CodeBuddy CN, Kimi, Grok CLI/Grok Build, and xAI/Grok.

### Free and cloud integrations

OpenCode Free, Gemini CLI, Kiro AI, OpenRouter, NVIDIA NIM, Ollama Cloud, Vertex AI, Gemini, Cloudflare, Poolside, BytePlus ModelArk, Kimchi, API.airforce, Bazaarlink, and Kilo Gateway.

### API-key integrations visible in the catalog

Alibaba, Alibaba Coding, Alibaba Studio, Anthropic, Azure OpenAI, Baidu Qianfan, Blackbox AI, Cerebras, Chutes AI, Cohere, Command Code, DeepSeek, Featherless, Fireworks AI, GLM, GLM Coding, Groq, Hyperbolic, LLM7, Minimax, and additional integrations in the expanded dashboard catalog.

## Contributing a result

Read [CONTRIBUTING.md](../CONTRIBUTING.md), then use the **Provider compatibility result** issue form. A maintainer or contributor can turn validated results into a pull request. Contributors are credited in the evidence column and release notes.
