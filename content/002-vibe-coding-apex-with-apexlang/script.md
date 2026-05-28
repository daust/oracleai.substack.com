# Script: Episode 002 — Vibe-Coding Oracle APEX Applications with APEXLang

---

## Introduction

Hey, welcome back to Oracle AI Field Notes.

APEX 26.1 dropped on May 14th — and with it, something I'd been waiting for: APEXLang. It's a new declarative format for describing APEX applications as text files. That might not sound exciting, but it means you can now treat your APEX app like source code — and feed it to an AI.

I've only just started experimenting with this, so this is genuinely a field report. It's new, it's rough in places, and I'll tell you where the current limits are. But the core loop — describe what you want, generate APEXLang, deploy with SQLcl, test in the browser — already works, and it's fast.

One thing I'll cover that's not obvious from the docs: `apex_application_install.set_keep_sessions(true)`. Without it, APEX logs you out on every import. That small setting makes the whole iteration cycle usable.

What I won't cover today: multi-user collaboration. Working copies in APEXLang aren't quite there yet for team workflows — that's a separate episode.

Alright, let's see what this thing can do.

[ACTION: show VS Code with a terminal open, APEX 26.1 running in a browser tab in the background]

---

## Setup

Before we dive in, here's what you need. I'll put all the download links in the description and the Substack article.

- [Oracle APEX 26.1](https://www.oracle.com/tools/downloads/apex-downloads/)
- [SQLcl 26.1.2](https://www.oracle.com/database/sqldeveloper/technologies/sqlcl/download/)
- [VS Code](https://code.visualstudio.com/download)
- [SQLcl extension for VS Code](https://www.oracle.com/database/sqldeveloper/vscode/download/)
- [Claude Code extension for VS Code](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code)

Most of these have their own install docs, so I won't walk through each one.

The one thing I do want to call out: to get the APEX skill in Claude Code, you need Node.js installed. Once you have that, run this in your terminal:

```bash
npx skills add oracle/skills/apex
```

That installs the Oracle APEX skill into Claude Code — which is what lets you prompt for APEXLang output. Without it, Claude Code doesn't know how to generate APEXLang files.

[ACTION: show terminal, run the npx command, show the skill being added]

Once that's done — you're ready.

---

## The APEXLang Workflow

Let's start simple. I want to show you the full roundtrip first before we get into a real example.

[ACTION: switch to VS Code, show Claude Code chat panel open]

I'll prompt the APEX skill to generate a minimal starter application:

```
/apex create a very simple starter application with two blank pages into the directory src/apex/simple-starter
```

[ACTION: show Claude Code generating files, show the src/apex/simple-starter directory appearing with APEXLang files]

What you get is a set of APEXLang files — a declarative text representation of your APEX application. Pages, navigation, application properties — all described as structured text. That's what we deploy.

## Deploying with SQLcl

Time to get this into APEX. I'll use SQLcl, connected to my database as the demo user.

[ACTION: show SQLcl terminal in VS Code, connected to the database]

Let's start with the simple starter app:

```sql
apex import -input src/apex/simple-starter
```

[ACTION: show the import running, then switch to browser and open the APEX App Builder — the new application appears]

There it is. Now let's add a page. Back in Claude Code:

```
Add another blank page to the simple-starter application called "About"
```

[ACTION: show Claude Code updating the APEXLang files]

Import again:

```sql
apex import -input src/apex/simple-starter
```

[ACTION: show App Builder — now there are two applications listed]

Notice the problem — it created a second application with a new ID instead of overwriting the first one. Not what we want.

To overwrite an existing application, you need to pass the target application ID explicitly:

```sql
apex import -input src/apex/simple-starter -id 103
```

[ACTION: show the import, then show the original app now has the About page — no duplicate]

Now let's do something more interesting. I have an Excel sheet — a project task tracker — and I want to turn it into a full APEX application, including the data model.

[ACTION: open project-tasks.xlsx, briefly show the contents]

Here's the prompt I use:

```
/apex convert the file project-tasks.xlsx into an Oracle APEX application in apexlang format.
The title of the application should be "Project Control"

For the data model, create all required files (based on the file type) for each object type
separately, under src/sql/demo, e.g. for tables, packages, views, triggers, etc.
And generate a driving script install.sql to run all scripts in the correct order.
Prefix all objects in the data model with PC_.

The apexlang application should be created under src/apex, the name of the directory
should be project-control.

The insert statements for seeding the data should be stored in src/sql-manual
and named: sample-data-install.sql.
```

[ACTION: show Claude Code working through this, show the generated directory structure: src/apex/project-control, src/sql/demo with tables/packages/views/triggers, src/sql-manual/sample-data-install.sql, and install.sql]

That's a lot of output from one prompt. A data model with prefixed objects, a driving install script, sample data, and a full APEX application — all from a spreadsheet.

Now install the application. First the data model:

```sql
@src/sql/demo/install.sql
```

Then the sample data:

```sql
@src/sql-manual/sample-data-install.sql
```

Then the application:

```sql
apex import -input src/apex/project-control
```

[ACTION: show import running, open the Project Control application in the browser]

The import runs a validation step automatically. If it throws errors, don't panic — paste them straight back into Claude Code and it'll fix them.

[ACTION: show validation errors appearing in the SQLcl output, copy them, paste into Claude Code chat]

Then re-import with the application ID to overwrite:

```sql
apex import -input src/apex/project-control -id 102
```

And if the application looks off in the browser — wrong layout, missing computations — take a screenshot and ask Claude directly:

```
should there not be numbers to be computed?
```

[ACTION: show screenshot pasted into Claude Code, show the fix being applied to the APEXLang files, re-import, show the fixed application]

That's the deploy loop. Generate, import, test, fix, repeat.

---

## Optimizing the Loop

There's one thing that will slow you down if you don't fix it upfront: every time you import an application, APEX invalidates your session and logs you out. When you're iterating fast, that login prompt gets old quickly.

[ACTION: show browser after an import — APEX login screen appears]

The fix is a single SQLcl command before your import:

```sql
exec apex_application_install.set_keep_sessions(true);
apex import -input src/apex/project-control -id 102
```

[ACTION: run the exec command, then the import, then switch to browser — application reloads without a login prompt]

That's it. `set_keep_sessions(true)` tells APEX not to invalidate existing sessions during the import. You stay logged in, the page reloads, and you can keep testing immediately.

One thing to know: this setting applies to the current SQLcl session. You'll need to run it again each time you reconnect.

With that in place, the full iteration loop looks like this:

1. Prompt Claude Code — generate or update APEXLang files
2. Run `exec apex_application_install.set_keep_sessions(true);`
3. Run `apex import -input src/apex/... -id NNN`
4. Test in the browser — no re-login
5. Repeat

[ACTION: show the loop running end to end at speed — prompt, exec, import, browser refresh]

---

## Implications for Oracle Teams

So what does this actually mean if you're building APEX applications for a living?

The obvious win is speed. Going from an Excel spec to a deployed application — data model, sample data, and UI — in a single session is genuinely new. A few months ago that would have taken days of clicking through App Builder.

But I think the bigger shift is that your APEX application is now source code. APEXLang files live in a directory, they're text, you can version-control them, diff them, and feed them back to an AI for changes. That's a different way of working with APEX.

A few things to keep in mind:

→ **This is very new.** APEX 26.1 and APEXLang shipped on May 14th. The tooling will evolve. Expect rough edges.

→ **Errors are part of the loop.** Validation errors on import are normal, especially for complex apps. Paste them back into Claude Code — it handles them well.

→ **Multi-user workflows aren't there yet.** Working copies in APEXLang aren't suited for parallel development by multiple developers. That's a real limitation right now. I'll cover that in a separate episode when the tooling catches up.

→ **Start simple.** The simple-starter roundtrip I showed first is a good warm-up. Get the loop working before you throw a complex Excel sheet at it.

For Oracle teams evaluating this: the question isn't whether AI can generate APEX apps — it clearly can. The question is whether your team can build a disciplined workflow around it. That's the work worth doing now, while the tooling is still maturing.

[ACTION: return to VS Code, show the final project-control application running in the browser]

That's it for this episode. Links to everything in the description. See you in the next one.
