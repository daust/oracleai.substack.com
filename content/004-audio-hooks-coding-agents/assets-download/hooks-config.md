# Claude Code Audio Hooks — Quick Reference

Add the `hooks` block to `~/.claude/settings.json`.

---

## macOS

Generate the audio files first:

```bash
mkdir -p ~/.claude/sounds
say -v Zarvox -r 110 "Attention. Choose your destiny." -o ~/.claude/sounds/attention.aiff
say -v Zarvox -r 110 "Flawless victory." -o ~/.claude/sounds/finished.aiff
```

Hooks config:

```json
"hooks": {
  "PermissionRequest": [
    { "hooks": [{ "type": "command", "command": "afplay ~/.claude/sounds/attention.aiff", "async": true }] }
  ],
  "PreToolUse": [
    { "matcher": "AskUserQuestion", "hooks": [{ "type": "command", "command": "afplay ~/.claude/sounds/attention.aiff", "async": true }] }
  ],
  "Notification": [
    { "matcher": "idle_prompt", "hooks": [{ "type": "command", "command": "afplay ~/.claude/sounds/attention.aiff", "async": true }] }
  ],
  "Stop": [
    { "hooks": [{ "type": "command", "command": "afplay ~/.claude/sounds/finished.aiff", "async": true }] }
  ]
}
```

---

## Windows

Place your audio files somewhere accessible (e.g. `C:\Users\you\sounds\`), then:

```json
"hooks": {
  "PermissionRequest": [
    { "hooks": [{ "type": "command", "command": "powershell -c (New-Object Media.SoundPlayer 'C:\\Users\\you\\sounds\\attention.wav').PlaySync()", "async": true }] }
  ],
  "PreToolUse": [
    { "matcher": "AskUserQuestion", "hooks": [{ "type": "command", "command": "powershell -c (New-Object Media.SoundPlayer 'C:\\Users\\you\\sounds\\attention.wav').PlaySync()", "async": true }] }
  ],
  "Notification": [
    { "matcher": "idle_prompt", "hooks": [{ "type": "command", "command": "powershell -c (New-Object Media.SoundPlayer 'C:\\Users\\you\\sounds\\attention.wav').PlaySync()", "async": true }] }
  ],
  "Stop": [
    { "hooks": [{ "type": "command", "command": "powershell -c (New-Object Media.SoundPlayer 'C:\\Users\\you\\sounds\\finished.wav').PlaySync()", "async": true }] }
  ]
}
```

Update file paths to match where you saved your audio files.

---

Verify hooks are loaded: type `/hooks` inside a Claude Code session.
