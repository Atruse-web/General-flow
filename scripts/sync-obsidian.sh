#!/bin/bash

# Obsidian Vault Sync Script
# Syncs planning documents to Obsidian vault while maintaining folder structure

set -e

# Configuration - UPDATE WITH YOUR OBSIDIAN VAULT PATH
OBSIDIAN_VAULT_PATH="${OBSIDIAN_VAULT_PATH:-}"
PLANNING_REPO_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Source directories to sync
SYNC_SOURCES=(
    "projects"
    "ideas"
    "technical-specs"
    "product-planning"
    "content-strategy"
    "research"
)

# Function to display usage
usage() {
    echo "Obsidian Vault Sync Script"
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -v, --vault PATH     Set Obsidian vault path (or use OBSIDIAN_VAULT_PATH env var)"
    echo "  -d, --dry-run        Show what would be synced without actually syncing"
    echo "  -h, --help           Show this help message"
    echo ""
    echo "Configuration:"
    echo "  Set OBSIDIAN_VAULT_PATH environment variable, or use -v flag"
    echo "  Example: export OBSIDIAN_VAULT_PATH=~/Documents/my-vault"
}

# Parse arguments
DRY_RUN=0
while [[ $# -gt 0 ]]; do
    case $1 in
        -v|--vault)
            OBSIDIAN_VAULT_PATH="$2"
            shift 2
            ;;
        -d|--dry-run)
            DRY_RUN=1
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            usage
            exit 1
            ;;
    esac
done

# Validate vault path
if [ -z "$OBSIDIAN_VAULT_PATH" ]; then
    echo "❌ Error: Obsidian vault path not set"
    echo ""
    echo "Please set OBSIDIAN_VAULT_PATH environment variable:"
    echo "  export OBSIDIAN_VAULT_PATH=/path/to/your/obsidian/vault"
    echo ""
    echo "Or pass it with -v flag:"
    echo "  $0 -v /path/to/your/obsidian/vault"
    exit 1
fi

# Validate vault exists
if [ ! -d "$OBSIDIAN_VAULT_PATH" ]; then
    echo "❌ Error: Obsidian vault path does not exist: $OBSIDIAN_VAULT_PATH"
    exit 1
fi

# Create sync folder in vault if it doesn't exist
SYNC_FOLDER="$OBSIDIAN_VAULT_PATH/Planning-General-Flow"
if [ ! -d "$SYNC_FOLDER" ]; then
    mkdir -p "$SYNC_FOLDER"
    echo "📁 Created sync folder: $SYNC_FOLDER"
fi

# Perform sync
echo "🔄 Syncing planning documents to Obsidian vault..."
echo "  From: $PLANNING_REPO_PATH"
echo "  To: $SYNC_FOLDER"
echo ""

if [ $DRY_RUN -eq 1 ]; then
    echo "📋 DRY RUN - Files that would be synced:"
fi

sync_count=0
for source_dir in "${SYNC_SOURCES[@]}"; do
    source_path="$PLANNING_REPO_PATH/$source_dir"

    if [ -d "$source_path" ]; then
        # Find all markdown files
        while IFS= read -r -d '' file; do
            # Get relative path from source directory
            rel_path="${file#$source_path/}"
            target_path="$SYNC_FOLDER/$source_dir/$rel_path"
            target_dir="$(dirname "$target_path")"

            if [ $DRY_RUN -eq 1 ]; then
                echo "  📄 $source_dir/$rel_path"
            else
                # Create target directory if needed
                mkdir -p "$target_dir"
                # Copy file
                cp "$file" "$target_path"
            fi

            ((sync_count++))
        done < <(find "$source_path" -name "*.md" -type f -print0)
    fi
done

if [ $DRY_RUN -eq 1 ]; then
    echo ""
    echo "📊 Would sync $sync_count file(s)"
    echo "✅ Dry run complete"
else
    echo ""
    echo "✅ Successfully synced $sync_count file(s)"
    echo "📁 Files are available in: $SYNC_FOLDER"
fi

exit 0
