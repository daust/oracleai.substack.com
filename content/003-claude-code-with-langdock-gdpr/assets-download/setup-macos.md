# Claude Code + Langdock (EU / GDPR) — macOS Setup

Route Claude Code through Langdock's EU endpoint so your data stays in the EU.
Same idea works for any Anthropic-compatible EU gateway — just swap the URL and model name.

No `winget` and no login-prompt issue on macOS. Two ways to set the variables.

## Option A — Per-session (or `~/.zshrc` for permanent)

```shell
export LANGDOCK_API_KEY=your-langdock-key

export ANTHROPIC_BASE_URL="https://api.langdock.com/anthropic/eu"
export ANTHROPIC_AUTH_TOKEN=${LANGDOCK_API_KEY}
export ANTHROPIC_MODEL="claude-sonnet-4-6-default"

claude
```

Add the `export` lines to `~/.zshrc` to make them permanent across terminal sessions.

## Option B — Project-scoped (recommended for VS Code)

Create `.claude/settings.local.json` in your project root:

```json
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://api.langdock.com/anthropic/eu",
    "ANTHROPIC_AUTH_TOKEN": "your-langdock-key",
    "ANTHROPIC_MODEL": "claude-sonnet-4-6-default"
  }
}
```

Use the `.local.json` variant (not `settings.json`) because it's meant to stay out of
version control — exactly where you want a file containing an API key. Add it to
`.gitignore`.

## Notes

- `ANTHROPIC_AUTH_TOKEN` is your **Langdock** key — NOT an Anthropic `sk-ant-…` key.
- `ANTHROPIC_MODEL` must match how your gateway names the model. Wrong name = failed
  first request.
- Sanity-check connectivity if a request fails: `nc -vz api.langdock.com 443`
