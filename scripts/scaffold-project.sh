#!/bin/bash

# Project Scaffolding Script
# Creates a new project planning folder with pre-populated templates

set -e

REPO_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATES_PATH="$REPO_PATH/templates"

# Function to display usage
usage() {
    echo "Project Scaffolding Script"
    echo ""
    echo "Usage: $0 [PROJECT_NAME]"
    echo ""
    echo "Examples:"
    echo "  $0 my-new-project"
    echo "  $0 feature-xyz-planning"
    echo ""
}

# Validate arguments
if [ $# -ne 1 ]; then
    echo "❌ Error: Project name required"
    usage
    exit 1
fi

PROJECT_NAME="$1"

# Validate project name (alphanumeric, hyphens, underscores)
if ! [[ "$PROJECT_NAME" =~ ^[a-zA-Z0-9_-]+$ ]]; then
    echo "❌ Error: Project name must contain only alphanumeric characters, hyphens, and underscores"
    exit 1
fi

# Create project directory
PROJECT_DIR="$REPO_PATH/projects/$PROJECT_NAME"

if [ -d "$PROJECT_DIR" ]; then
    echo "❌ Error: Project folder already exists: $PROJECT_DIR"
    exit 1
fi

echo "🚀 Creating project: $PROJECT_NAME"
mkdir -p "$PROJECT_DIR"

# Create subdirectories
mkdir -p "$PROJECT_DIR/specs"
mkdir -p "$PROJECT_DIR/features"
mkdir -p "$PROJECT_DIR/research"
mkdir -p "$PROJECT_DIR/notes"

# Copy and customize templates
echo "📝 Creating project files..."

# PROJECT BRIEF
cat > "$PROJECT_DIR/00-BRIEF.md" << 'EOF'
# Project Brief

> Edit this file with your project overview and planning.
> See the README.md at the repository root for guidance.

## Project Overview

**Project Name:** [Your Project Name]
**Status:** Planning
**Created:** $(date +%Y-%m-%d)
**Owner:** [Your Name]

## Vision & Goals

[Add your project vision and goals here]

## Scope

### In Scope
- [Feature/component]
- [Feature/component]

### Out of Scope
- [Excluded item]

## Next Steps

1. [Action item]
2. [Action item]

---

**Last Updated:** $(date +%Y-%m-%d)
EOF

# TECHNICAL SPEC (optional, with guidance)
cat > "$PROJECT_DIR/specs/01-ARCHITECTURE.md" << 'EOF'
# Technical Architecture

> When you're ready to plan technical implementation details, use this file.
> Reference the TECHNICAL_SPEC.md template in /templates/ for detailed guidance.

## Overview

[Add your technical overview here]

## Architecture Diagram

```
[ASCII diagram of system architecture]
```

## Key Components

[Describe major components and their relationships]

## Implementation Phases

[Break down your technical implementation into phases]

---

**Status:** Planning
**Last Updated:** $(date +%Y-%m-%d)
EOF

# RESEARCH GATHERING
cat > "$PROJECT_DIR/research/01-RESEARCH.md" << 'EOF'
# Research & Planning

> Use this section to document findings, competitive analysis, and learnings.
> Create additional files as needed (01-research.md, 02-competitive-analysis.md, etc.)

## Research Topics

[List topics you'll research for this project]

## Key Findings

[As you research, document findings here]

---

**Status:** In Progress
**Last Updated:** $(date +%Y-%m-%d)
EOF

# WORKING NOTES
cat > "$PROJECT_DIR/notes/01-NOTES.md" << 'EOF'
# Working Notes

> Use this file for brainstorming, open questions, decisions, and iterative thinking.
> Keep this loose and evolve it as you think through the project.

## Initial Thoughts

[Your initial thoughts about this project]

## Open Questions

- [Question]
- [Question]

## Key Decisions Made

- [Decision]: [Rationale]

## Ideas to Explore

- [Idea]
- [Idea]

---

**Last Updated:** $(date +%Y-%m-%d)
EOF

echo ""
echo "✅ Project scaffold created successfully!"
echo ""
echo "📁 Project structure:"
echo "   $PROJECT_DIR"
echo "   ├── 00-BRIEF.md (project overview)"
echo "   ├── specs/"
echo "   │   └── 01-ARCHITECTURE.md"
echo "   ├── features/ (add feature files here)"
echo "   ├── research/"
echo "   │   └── 01-RESEARCH.md"
echo "   └── notes/"
echo "       └── 01-NOTES.md"
echo ""
echo "🎯 Next steps:"
echo "   1. Edit 00-BRIEF.md with your project overview"
echo "   2. Add research findings to research/"
echo "   3. Create feature planning files in features/"
echo "   4. Update technical specs as you refine your approach"
echo ""
echo "💡 Tips:"
echo "   - Use numbered prefixes (00-, 01-) to organize files"
echo "   - Cross-reference files with markdown links"
echo "   - Commit regularly to track your planning evolution"
echo ""

exit 0
