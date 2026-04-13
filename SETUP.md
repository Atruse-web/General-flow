# Setup Guide - Planning Repository

Complete this setup to get the most out of your planning repository.

## Step 1: Configure Obsidian Sync (Optional but Recommended)

If you use Obsidian and want automatic syncing:

### 1a. Find Your Vault Path

1. Open Obsidian
2. Click on the vault name in the bottom-left
3. Note the file path of your vault

### 1b. Set Environment Variable

Add this to your shell profile (`.bashrc`, `.zshrc`, etc.):

```bash
export OBSIDIAN_VAULT_PATH="/path/to/your/obsidian/vault"
```

Then reload: `source ~/.bashrc` or restart your terminal

### 1c. Test Sync

Run:
```bash
./scripts/sync-obsidian.sh
```

You should see:
```
🔄 Syncing planning documents to Obsidian vault...
✅ Successfully synced X file(s)
```

Your planning documents will now be in `[YourVault]/Planning-General-Flow/`

## Step 2: Create Your First Project

```bash
./scripts/scaffold-project.sh my-first-project
```

This creates a new project folder with templates:
```
projects/my-first-project/
  ├── 00-BRIEF.md
  ├── specs/01-ARCHITECTURE.md
  ├── features/
  ├── research/01-RESEARCH.md
  └── notes/01-NOTES.md
```

## Step 3: Understand the Workflow

### Planning Workflow

1. **Capture Ideas** → `/ideas/`
   - Use quick brainstorms to capture rough concepts

2. **Research** → `/research/`
   - Document findings, competitive analysis, learnings

3. **Create Project Brief** → `/projects/[name]/`
   - Overview of goals, scope, approach

4. **Deep Design Planning** → `/projects/[name]/specs/` and `/features/`
   - Technical specifications
   - Feature planning
   - Architecture decisions

5. **Iterate & Refine**
   - Use notes for open questions and decisions
   - Cross-reference related documents
   - Commit regularly to track evolution

6. **Move to Implementation**
   - Copy planning to your implementation repo
   - Reference this planning for architectural decisions

### File Naming Convention

Use numbered prefixes for organization:

```
00-BRIEF.md          (project overview)
01-ARCHITECTURE.md   (technical design)
02-DESIGN-SYSTEM.md  (design specifications)
03-FEATURES.md       (feature planning)
```

### Cross-Linking

Link related documents using markdown:

```markdown
See [Technical Architecture](specs/01-ARCHITECTURE.md) for implementation details.

Related: [Feature Planning](features/01-PAGES.md)
```

## Step 4: Use Templates

All templates are in `/templates/`:

- `PROJECT_BRIEF.md` - Project overview
- `TECHNICAL_SPEC.md` - Technical design
- `FEATURE_PLAN.md` - Individual feature planning
- `RESEARCH.md` - Research documentation
- `IDEATION.md` - Brainstorming notes

Copy them to your project folders and fill them out.

## Step 5: Set Up Claude Code Integration

### Option A: VS Code Extension

If using VS Code + Claude Code extension:

1. Open folder with Claude Code
2. Start a session with this repository
3. The session will automatically recognize project structure

### Option B: Web Browser

Visit [claude.ai/code](https://claude.ai/code) and:

1. Import this repository
2. Start planning sessions

### Option C: CLI

```bash
claude code /path/to/General-flow
```

## Step 6: Commit & Sync Workflow

### Making Changes

1. Edit your planning documents
2. Save and commit:
   ```bash
   git add .
   git commit -m "Plan: [description of what you planned]"
   ```
3. If Obsidian sync is set up, files automatically sync to your vault

### Manual Sync to Obsidian

```bash
./scripts/sync-obsidian.sh
```

## Common Workflows

### Starting a New Project

```bash
# Create project structure
./scripts/scaffold-project.sh project-name

# Edit the brief
cd projects/project-name
# Edit 00-BRIEF.md

# Do research
# Edit research/01-RESEARCH.md

# Plan technical approach
# Edit specs/01-ARCHITECTURE.md

# Create feature planning
# Create features/01-FEATURE.md

# Commit your planning
git add .
git commit -m "Plan: Add comprehensive planning for project-name"
```

### Quick Brainstorming Session

```bash
# Add to ideas folder
# Create ideas/YYYY-MM-DD-idea-name.md

# Brainstorm using IDEATION.md template

git add .
git commit -m "Idea: Capture brainstorm on [topic]"
```

### Research & Learning

```bash
# Create research document
# Use /research folder

# Document findings as you learn

git add .
git commit -m "Research: Add findings on [topic]"
```

## Obsidian Integration Tips

### Folder Structure in Obsidian

After sync, you'll have:
```
Planning-General-Flow/
  ├── projects/
  │   ├── my-first-project/
  │   └── EXAMPLE-web-redesign/
  ├── ideas/
  ├── research/
  ├── technical-specs/
  └── ...
```

### Best Practices

1. **Keep both repos in sync:** After planning in Claude Code, sync to Obsidian
2. **Use backlinks:** Link documents in Obsidian for relationship visualization
3. **Create index:** Consider creating an INDEX.md for your vault linking to planning
4. **Tagging:** Use tags like `#project/name`, `#status/planning` for organization

## Troubleshooting

### Sync not working?

1. Check environment variable: `echo $OBSIDIAN_VAULT_PATH`
2. Verify vault path exists: `ls -la $OBSIDIAN_VAULT_PATH`
3. Run manually: `./scripts/sync-obsidian.sh -d` (dry run)

### Permission errors?

```bash
chmod +x scripts/*.sh
chmod +x .githooks/*
```

### Git hooks not running?

```bash
git config core.hooksPath .githooks
```

## Next Steps

1. ✅ Update CLAUDE.md with your Obsidian vault path
2. ✅ Delete the EXAMPLE-web-redesign folder (just a sample)
3. ✅ Create your first project: `./scripts/scaffold-project.sh my-project`
4. ✅ Start planning!

---

**Setup Date:** 2026-04-13
**Last Updated:** 2026-04-13

Happy planning! 🚀
