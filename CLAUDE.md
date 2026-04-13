# Claude Code Configuration

This file configures Claude Code behavior for optimal planning workflows.

## Environment Configuration

```
OBSIDIAN_VAULT_PATH=/desktop/vault
PLANNING_REPO_PATH=/home/user/General-flow
```

**Configured:** ✅ Your vault path is set to `/desktop/vault`

To make this persistent, add to your shell profile (`.bashrc`, `.zshrc`, etc.):
```bash
export OBSIDIAN_VAULT_PATH=/desktop/vault
```

## Automated Hooks

### Session Start Hook
- **Purpose:** Set context when you start working in this repo
- **Triggers:** When you begin a Claude Code session in this directory
- **Action:** Loads project context, suggests relevant templates, displays recent planning

### Post-Commit Hook
- **Purpose:** Sync files to Obsidian vault
- **Triggers:** After each commit
- **Action:** Copies markdown files to your Obsidian vault, maintaining structure

### New Project Scaffolding
- **Purpose:** Create new project planning structure
- **Triggers:** Manual invocation via `scripts/scaffold-project.sh`
- **Action:** Creates folder structure with pre-populated templates

## Workflows

### Planning a New Project

1. Run `scripts/scaffold-project.sh [project-name]`
2. Fill in the pre-created templates
3. Use Claude Code for iterative refinement
4. When ready, move to implementation repository

### Working with Existing Plans

1. Open the relevant file in `/projects/[name]/`
2. Ask Claude to help expand, refine, or debug your plans
3. Changes auto-sync to Obsidian on commit
4. Reference linked documents for context

### Syncing to Obsidian

**Automatic:** Sync runs on every commit via post-commit hook

**Manual:** 
```bash
./scripts/sync-obsidian.sh
```

## Recommended Claude Code Settings

- **Model:** Claude 4.6 (Opus) for deep thinking - or Haiku for quick iterations
- **Context:** This repo should maintain strong context of your planning approach
- **Style:** Conversational, exploratory - this is thinking space

---

**Note:** Keep this file updated with your preferences and paths as you develop your workflow.
