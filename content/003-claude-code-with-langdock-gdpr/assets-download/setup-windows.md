# Claude Code + Langdock (EU / GDPR) — Windows Setup

Route Claude Code through Langdock's EU endpoint so your data stays in the EU.
Same idea works for any Anthropic-compatible EU gateway — just swap the URL and model name.

## 1. Install Claude Code

```shell
winget install Anthropic.ClaudeCode
claude --version
```

## 2. Confirm you can reach the EU endpoint

On a corporate machine, check the network *before* touching config:

```powershell
Test-NetConnection api.langdock.com -Port 443
```

Look for `TcpTestSucceeded : True`. If it fails, it's a firewall/proxy issue for IT
to allowlist — not a Claude Code problem.

## 3. Set the three System environment variables

Set these in the Windows System environment (Settings → "Edit the system environment
variables" → Environment Variables) so every terminal and VS Code picks them up:

```shell
ANTHROPIC_BASE_URL="https://api.langdock.com/anthropic/eu"
ANTHROPIC_AUTH_TOKEN="your-langdock-key"
ANTHROPIC_MODEL="claude-sonnet-4-6-default"
```

Notes:
- `ANTHROPIC_AUTH_TOKEN` is your **Langdock** key — NOT an Anthropic `sk-ant-…` key.
- `ANTHROPIC_MODEL` must match how your gateway names the model. Wrong name = failed
  first request.

## 4. Verify the variables are set

In a fresh `cmd.exe`:

```shell
set | findstr "ANTHROPIC"
```

## 5. Disable the VS Code login prompt (the common gotcha)

The variables are picked up, but the VS Code extension still shows the Anthropic login
dialog. Disable it:

1. Command palette: **Ctrl+Shift+P**
2. Select **"Preferences: Open User Settings (JSON)"**
3. Add:

```json
{
    "claudeCode.disableLoginPrompt": true
}
```

4. Save and **restart VS Code**.

Done — Claude Code now runs against the Langdock EU endpoint.
