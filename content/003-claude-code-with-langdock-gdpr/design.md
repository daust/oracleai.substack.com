# Episode 003: Claude Code + Langdock — GDPR-Compliant AI Coding (Windows & macOS)

**Status:** Draft
**Goal:** Run Claude Code on Windows and macOS through Langdock's EU API endpoint, so their AI coding assistant stays GDPR-compliant and data never leaves the EU.
**Audience:** IT managers, enterprise architects, and Oracle platform owners — the people who sign off on whether an AI tool is allowed in the org — while remaining followable by hands-on developers.

## Requirements

- A Langdock account with API access (to obtain a Langdock API key) — EU endpoint
- Claude Code — installed *either* as:
  - the Claude Code CLI (via `winget` on Windows / standard installer on macOS), **or**
  - VS Code with the Claude Code extension
- Windows 11 (with `winget`) or macOS
- Git Bash / a POSIX shell (Windows only — carried over from Episode 1's baseline)
- Network access to `api.langdock.com` on port 443 (corporate firewalls/proxies may block it)

## Outline

1. What I wanted to test — can Claude Code run through an EU gateway so no data leaves the EU? Why GDPR makes this a blocker for many Oracle shops.
2. Background: What is Langdock? (And why it's only one option) — EU AI gateway, GDPR posture, Anthropic-compatible EU endpoint, security page, and alternatives.
3. The setup — the three environment variables that redirect Claude Code (`ANTHROPIC_BASE_URL`, `ANTHROPIC_AUTH_TOKEN`, `ANTHROPIC_MODEL`).
4. The experiment — configure and verify on Windows (winget, system env vars, VS Code login-prompt fix) and macOS (export vars / `settings.local.json`); plus letting Claude Code configure itself.
5. What worked / what failed — the VS Code login-prompt gotcha, firewall/port 443, model-name mapping, gateway-key-vs-Anthropic-key.
6. Implications for Oracle teams — how this unblocks AI adoption under EU data-residency and GDPR governance.
