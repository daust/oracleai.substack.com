# Cheat Sheet — GDPR-Compliant Claude Code via an EU Gateway

The whole trick: Claude Code chooses its endpoint from environment variables. Override
them to route through an EU gateway so your data stays in the EU.

## The three variables

```shell
ANTHROPIC_BASE_URL="https://api.langdock.com/anthropic/eu"   # the EU redirect
ANTHROPIC_AUTH_TOKEN="your-langdock-key"                     # your GATEWAY key (not sk-ant-…)
ANTHROPIC_MODEL="claude-sonnet-4-6-default"                  # the gateway's model name
```

## Where to put them

| Platform | Where |
|----------|-------|
| Windows  | System environment variables + `"claudeCode.disableLoginPrompt": true` in VS Code user settings |
| macOS    | `export` in `~/.zshrc`, or `.claude/settings.local.json` in the project |

See `setup-windows.md` and `setup-macos.md` for full steps.

## Let Claude Code configure itself

Once Claude Code runs, ask it to write its own config:

> "Create a `.claude/settings.local.json` that routes Claude Code through the Langdock
> EU endpoint. Use the model `claude-sonnet-4-6-default` and leave a placeholder for my
> API key. Then add the file to `.gitignore`."

## Langdock is just one option

Whatever EU / privacy-focused, Anthropic-compatible provider you pick, the setup is
identical — only `ANTHROPIC_BASE_URL` and the model name change.

- Langdock security page (send this to legal/security): https://langdock.com/security
- Find alternatives: https://mega.fragroger.ai/
- EU-hosted alternatives directory: https://european-alternatives.eu/

> Not affiliated with any of these. Langdock is just a clean, working example.
