#!/bin/bash
set -euo pipefail

# Planning Repository Session Start Hook
# Initializes the planning environment and displays helpful context

echo '{"async": false}'

REPO_ROOT="${CLAUDE_PROJECT_DIR:-.}"

# Make scripts executable
chmod +x "$REPO_ROOT/scripts"/*.sh 2>/dev/null || true
chmod +x "$REPO_ROOT/.githooks"/* 2>/dev/null || true

# Configure git hooks
cd "$REPO_ROOT"
git config core.hooksPath .githooks 2>/dev/null || true

# Load Obsidian vault path if set
if [ -f "$REPO_ROOT/CLAUDE.md" ]; then
  VAULT_PATH=$(grep "OBSIDIAN_VAULT_PATH=" "$REPO_ROOT/CLAUDE.md" | head -1 | cut -d'=' -f2 | tr -d ' ')
  if [ -n "$VAULT_PATH" ]; then
    export OBSIDIAN_VAULT_PATH="$VAULT_PATH"
    if [ -n "${CLAUDE_ENV_FILE:-}" ]; then
      echo "export OBSIDIAN_VAULT_PATH=\"$VAULT_PATH\"" >> "$CLAUDE_ENV_FILE"
    fi
  fi
fi

# Display planning environment status
cat << 'EOF'

════════════════════════════════════════════════════════════════
                    📋 PLANNING REPOSITORY
════════════════════════════════════════════════════════════════

✅ Environment Initialized

📁 Available Commands:

  Create a new project:
  $ ./scripts/scaffold-project.sh [project-name]

  Sync to Obsidian vault (on your Mac):
  $ ./scripts/sync-obsidian.sh

  Dry-run sync (preview what would sync):
  $ ./scripts/sync-obsidian.sh -d

📂 Folder Structure:

  /projects          → Individual project planning
  /ideas            → Brainstorming and ideation
  /research         → Research and reference materials
  /templates        → Reusable planning templates
  /technical-specs  → Technical design documents
  /product-planning → Product and feature planning
  /content-strategy → Content planning
  /archives         → Completed planning sessions

📖 Documentation:

  README.md  → Overview and workflow
  SETUP.md   → Step-by-step setup guide
  CLAUDE.md  → Configuration and hooks

🎯 Quick Start:

  1. Create a project: ./scripts/scaffold-project.sh my-project
  2. Edit files in /projects/my-project/
  3. Commit: git add . && git commit -m "Plan: ..."
  4. Push: git push origin claude/launch-cli-tool-ti1Or
  5. Later on Mac: ask me to sync to Obsidian

════════════════════════════════════════════════════════════════

Ready to plan! 🚀

EOF

exit 0
