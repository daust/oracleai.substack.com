# Episode 002: Vibe-Coding Oracle APEX Applications with APEXLang

**Status:** In Progress
**Goal:** The viewer can vibe-code a complete Oracle APEX application using APEXLang in VS Code with SQLcl, and optimize the import workflow using `apex_application_install.set_keep_sessions(true)` to avoid logging in after every change.
**Audience:** Oracle developer

## Requirements

- [Oracle APEX 26.1](https://www.oracle.com/tools/downloads/apex-downloads/)
- [SQLcl 26.1.2](https://www.oracle.com/database/sqldeveloper/technologies/sqlcl/download/)
- [VS Code](https://code.visualstudio.com/download)
- [SQLcl extension for VS Code](https://www.oracle.com/database/sqldeveloper/vscode/download/)
- [Claude Code extension for VS Code](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code)
- Node.js (required to install the APEX skill)

## Outline

1. Introduction — what vibe-coding APEX means and what we're building today
2. Setup — tools needed; installing the APEX skill with `npx skills add oracle/skills/apex`
3. The APEXLang Workflow — using the apex skill to generate a starter app and convert an Excel sheet to a full APEX application
4. Deploying with SQLcl — importing apps, the duplicate ID problem, using `-id` to overwrite
5. Optimizing the Loop — `apex_application_install.set_keep_sessions(true)` to avoid re-login on every import
6. Implications for Oracle Teams — speed, APEXLang as source code, current limitations
