# Setting up VS Code + Claude Code

**Theme:** AI Tools in the Enterprise Workflow
**Format:** Video (8–12 min) + Substack article
**Status:** Draft

---

## Purpose

This is the **foundation episode** — before we can do any AI-assisted Oracle development, we need a working environment. This video walks through downloading, installing, and configuring VS Code with Claude Code so every viewer starts from the same baseline.

Designed to be modular: later episodes can link back here ("if you haven't set up your environment yet, start here") and the setup steps can be remixed for other tool combinations (Cursor, ChatGPT, etc.).

---

## Video Structure

### 1. What I Wanted to Test
- Can a developer (or IT manager) with no prior AI tooling experience set up Claude Code in under 15 minutes?
- What's the actual friction in getting started?

### 2. The Setup
- Machine: Windows 11
- Starting point: fresh VS Code install (or existing — note both paths)
- Prerequisites: Anthropic account

### 3. The Experiment — Step by Step

#### Step 1: Download and Install VS Code
- Go to https://code.visualstudio.com/
- Download for your OS (Windows / macOS / Linux)
- Run installer, launch VS Code

#### Step 2: Install Git Bash (Windows only)
Claude Code requires a POSIX-compliant shell. Install **Git for Windows** (https://git-scm.com/) — this gives you Git Bash. It's usually already present on developer machines. WSL2 also works if you prefer a full Linux environment, but Git Bash is the quickest path.

> **Note for enterprise environments:** Git Bash typically requires no IT approval.

#### Step 3: Install Claude Code Extension in VS Code
- Open VS Code Extensions panel (Ctrl+Shift+X)
- Search for "Claude Code"
- Install the Anthropic extension
- Restart VS Code if prompted
- The extension handles the CLI setup automatically

#### Step 4: Authenticate with Anthropic
- Sign in / create account at https://claude.ai/
- The first time you run `claude` in the terminal (or open the VS Code panel), it will prompt you to log in via browser
- Alternatively: generate an API key at https://console.anthropic.com/ and set it as an environment variable

#### Step 5: First Test — Open a Project
- Open any folder in VS Code
- Open Claude Code panel (or run `claude` in the integrated terminal)
- Type a simple prompt to verify it's working: "Explain what this folder contains"

#### Step 6: Basic Configuration (optional but useful)
- Set default model (Sonnet vs Opus — explain the tradeoff: speed vs depth)
- Review usage/billing settings

### 4. What Worked / What Failed
- [Fill in after recording]
- Common gotchas:
  - **Windows:** Missing POSIX shell — install Git Bash (or WSL2) before opening VS Code
  - **API key vs browser login:** Two auth paths exist; browser login is simpler for first-time setup
  - Billing setup may be required before the CLI activates (Anthropic requires a payment method even for low usage)

### 5. Implications for Oracle Teams
- Zero infrastructure required — runs locally against Oracle files
- Any team member can set this up independently
- Natural next step: point it at an Oracle schema or PL/SQL package

---

## YouTube

**Title:** Setting Up VS Code + Claude Code — Step by Step for Oracle Developers

**Description:**
```
In this video I walk through the complete setup for VS Code + Claude Code on Windows —
the foundation for every AI experiment in this series.

What you'll learn:
→ Install Git Bash (the Windows shell requirement)
→ Install VS Code
→ Install the Claude Code extension
→ Run your first AI prompt inside a project

This is Episode 1 of Oracle AI Field Notes — practical AI experiments for Oracle enterprise teams.

📄 Full article + step-by-step guide: [Substack link — add after publishing]
🔗 Claude Code quickstart: https://code.claude.com/docs/en/quickstart

---
Chapters:
0:00 Intro
[fill in after reviewing recording]
```

---

## Substack Article Draft

**Title:** How to Set Up VS Code + Claude Code

**Subtitle:** Before engaging in any AI-assisted coding, first we need a working environment.

**Intro paragraph:**
Every experiment in this series runs inside the same environment: VS Code with Claude Code. If you're an Oracle developer and want to follow along — or run these experiments yourself — this is where to start. Four steps, under 15 minutes, no prior AI tooling experience required.

**Body:**

[embed YouTube video]
https://youtu.be/CRpmKIE6ZGU

---

### Step-by-Step Guide

#### Step 1: Install Git

- Download: https://git-scm.com/install/windows
- Install, then restart your terminal
- Verify:
```bash
git --version
```

#### Step 2: Install VS Code

- Download and install from https://code.visualstudio.com
- Open a project folder from the terminal:
```bash
code .
```

#### Step 3: Install the Claude Code Extension

- In VS Code: Extensions (Ctrl+Shift+X) → search **Claude Code** → Install

#### Step 4: Initialize Claude in Your Project

- Open the terminal inside VS Code
- Run:
```
/init
```
- Try your first prompt: *"What does this project do?"*

**Full quickstart guide:** https://code.claude.com/docs/en/quickstart

---

**CTA:** "Next: [Episode 2 title]"

---

## LinkedIn Post Draft

Just published Episode 1 of Oracle AI Field Notes.

Before we can run any AI experiments on Oracle code, we need a working environment.

Here's the 4-step setup I use on Windows:
→ Install Git (for the shell)
→ Install VS Code
→ Install the Claude Code extension
→ Run /init and ask your first question

This is the foundation for everything that follows — PL/SQL generation, schema analysis, code review.

Video walkthrough: https://youtu.be/CRpmKIE6ZGU
Full article: [Substack link — add after publishing]

What AI tools are your Oracle teams using today?

#Oracle #AITools #EnterpriseAI #ClaudeCode #VSCode

---

## Notes / Open Questions

- [ ] Decide: record on Windows or Mac? (Consider which is more common in Oracle enterprise shops)
- [ ] Check whether Claude Code requires a paid Anthropic plan or works on free tier
- [ ] Consider adding a short segment: "what is Claude Code and why not just use ChatGPT?" — sets the stage for the whole series
- [ ] Thumbnail concept: split screen — terminal/IDE on left, Oracle logo on right

