# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

**General Flow** is a planning and conceptualization repository—a dedicated space for deep thinking before moving work into implementation-specific repos. It's designed for capturing ideas, researching approaches, planning architecture, and building comprehensive specifications before coding.

This is not a traditional code repository. It contains planning documents, research, and ideation files in markdown format, organized by planning phase and project.

## Repository Architecture

The repo is organized around a **planning workflow pipeline**:

```
Ideas → Research → Project Planning → Technical Specs → Implementation
(ideas/) (research/) (projects/) (specs/) [other repos]
```

### Folder Structure

- **`/projects/[name]/`** - Complete project planning with subfolders:
  - `00-BRIEF.md` - Project overview, goals, scope, timeline
  - `specs/` - Technical architecture and design decisions
  - `features/` - Individual feature planning
  - `research/` - Project-specific research and findings
  - `notes/` - Working notes and open questions

- **`/ideas/`** - Initial brainstorms and concept capture (use IDEATION template)
- **`/research/`** - Shared research, competitive analysis, learnings
- **`/templates/`** - Reusable planning templates for all document types
- **`/archives/`** - Completed or superseded planning sessions

### Planning Document Types

When working with documents, understand these types:
- **Project Brief** - High-level overview (vision, goals, scope, timeline, risks)
- **Technical Spec** - Architecture, design decisions, implementation approach
- **Feature Plan** - User stories, acceptance criteria, implementation details
- **Research** - Findings, competitive analysis, best practices, recommendations
- **Ideation** - Brainstorms, concept exploration, feasibility assessment

## Common Commands

### Create a New Project
```bash
./scripts/scaffold-project.sh [project-name]
```
Creates a new project folder with pre-populated templates and structure. This is the starting point for most planning work.

### Sync to Obsidian Vault
```bash
./scripts/sync-obsidian.sh
```
Manually syncs all planning documents to your Obsidian vault (set via `OBSIDIAN_VAULT_PATH` env var). This runs automatically on every commit via post-commit hook.

### Test Sync (Dry Run)
```bash
./scripts/sync-obsidian.sh -d
```
Preview what would be synced without actually copying files.

### Commit Planning Work
```bash
git add .
git commit -m "Plan: [clear description of what was planned]"
git push origin claude/launch-cli-tool-ti1Or
```
Use clear commit messages starting with "Plan:" or "Idea:" or "Research:" to indicate the type of planning work.

## Environment & Automation

### SessionStart Hook
When you start a Claude Code session, `.claude/hooks/session-start.sh` runs automatically to:
- Display planning context and available commands
- Configure git hooks
- Load environment variables (including Obsidian vault path)

This hook ensures the planning environment is ready without manual setup.

### Post-Commit Hook
The `.githooks/post-commit` hook automatically syncs your planning documents to your Obsidian vault after each commit (if `OBSIDIAN_VAULT_PATH` is set).

### Configuration
- **Obsidian Vault Path:** Set via environment variable `OBSIDIAN_VAULT_PATH` or update in CLAUDE.md
- **Git Hooks Path:** Configured to use `.githooks/` directory via `git config core.hooksPath`

## How to Help Users with This Repo

When assisting with planning work:

1. **Understand the planning phase** - Is this early ideation, research, project planning, or detailed specs? Different templates apply.

2. **Guide document structure** - Help users use the templates from `/templates/` to maintain consistent structure across projects.

3. **Cross-reference related planning** - Help users link related documents (e.g., from project brief to technical spec to feature plans).

4. **Suggest scaffolding** - When starting new projects, guide users to run `./scripts/scaffold-project.sh` rather than creating folders manually.

5. **Encourage iteration** - This is thinking space. Help users refine and evolve their plans iteratively, committing frequently to track thinking evolution.

6. **Connect to implementation** - Once planning is complete, help users understand how to use these specifications in their implementation repos.

## Workflow Tips

- **Use numbered prefixes** (00-, 01-, 02-) to organize related documents and create implicit ordering
- **Create project-specific research folders** (`/projects/[name]/research/`) for research specific to that project
- **Archive completed planning** - Move finished planning sessions to `/archives/` to keep `/projects/` focused on active work
- **Cross-link documents** - Use markdown links to connect related planning documents for better navigation
- **Keep notes updated** - Maintain `/projects/[name]/notes/` for open questions, decisions made, and evolving thinking

## Key Files

- **README.md** - Overview of repository purpose and structure
- **SETUP.md** - Step-by-step setup instructions (onboarding guide)
- **templates/** - Use these as starting points for all planning documents
- **.claude/settings.json** - Claude Code hook configuration
- **.githooks/post-commit** - Auto-sync to Obsidian on commit
