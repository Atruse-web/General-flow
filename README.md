# General Flow - Planning & Conceptualization Repository

A dedicated space for deep planning sessions, architectural thinking, product strategy, and comprehensive project conceptualization before moving work into implementation-specific repositories.

## Purpose

This repository serves as your **planning command center** where you:
- Conceptualize ideas before building
- Design technical architecture
- Plan product roadmaps and features
- Research and document approaches
- Capture brainstorms and ideation
- Build comprehensive project briefs before coding

## Repository Structure

```
.
├── /projects              # Individual project planning folders
├── /ideas                 # Brainstorming and idea capture
├── /technical-specs       # Technical design & architecture documents
├── /product-planning      # Product roadmaps, feature planning, strategy
├── /content-strategy      # Content planning, writing strategy, narratives
├── /research              # Research findings, reference materials, docs
├── /archives              # Completed or archived planning sessions
├── /templates             # Reusable planning templates
└── /scripts               # Utility scripts (sync, automation, etc.)
```

## Quick Start

### Starting a New Planning Session

1. **Create a project folder** in `/projects/[project-name]`
2. **Use a template** from `/templates/` as your starting point
3. **Work iteratively** - refine and expand your thinking
4. **Move to implementation** when you're ready to build

### Document Types

- **Project Briefs** - Comprehensive overview of a project
- **Technical Specs** - Architecture, design decisions, implementation approach
- **Feature Planning** - Feature breakdowns, user stories, requirements
- **Research Docs** - Findings, references, learnings
- **Ideation Notes** - Brainstorms, concept sketches, explorations
- **Strategy Docs** - Roadmaps, vision, long-term planning

## Workflow with Claude Code

This repository is optimized for Claude Code sessions:

- Use the **session-start hook** to automatically scaffold new planning contexts
- Templates are pre-loaded for quick access
- Issues track planning progress across projects
- Automated sync keeps your Obsidian vault updated

## Syncing with Obsidian

Your planning documents automatically sync to your Obsidian vault. The sync:
- Copies all markdown files from planning folders
- Maintains folder structure in Obsidian
- Runs on commit (via post-commit hook)
- Can be manually triggered via `scripts/sync-obsidian.sh`

Configure your vault path in `CLAUDE.md` or environment variables.

## Best Practices

1. **Be specific** - Use descriptive file names and headings
2. **Iterate openly** - This is thinking space, embrace revisions
3. **Cross-reference** - Link related planning documents
4. **Archive regularly** - Move completed planning to `/archives`
5. **Use templates** - They provide structure for better thinking
6. **Keep it organized** - One folder per major project/initiative

## Integration with Other Repos

Once planning is complete:
1. Use this planning as your specification
2. Move to your implementation repos
3. Reference back here for architectural decisions
4. Update here if strategy changes during development

---

**Last Updated:** 2026-04-13
**Branch:** claude/launch-cli-tool-ti1Or
