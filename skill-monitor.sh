#!/bin/bash
# Skill Backup Monitor
# Monitors /opt/data/skills/ for changes and pushes to GitHub

SKILLS_DIR="/opt/data/skills"
BACKUP_DIR="/opt/data/skill-backups"
REPO_DIR="/opt/data/hermes-agent-backup"
LOG_FILE="/opt/data/skill-backups/backup.log"
LOCK_FILE="/opt/data/skill-backups/.backup.lock"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Ensure directories exist
mkdir -p "$BACKUP_DIR"
mkdir -p "$REPO_DIR"

# Check for running backup
if [ -f "$LOCK_FILE" ]; then
    log "Backup already in progress, skipping..."
    exit 0
fi
touch "$LOCK_FILE"

trap "rm -f $LOCK_FILE" EXIT

# Find all skill files
log "Scanning skills directory..."
SKILL_COUNT=$(find "$SKILLS_DIR" -name "SKILL.md" 2>/dev/null | wc -l)
log "Found $SKILL_COUNT skills"

# Create backup
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="${BACKUP_DIR}/backup_${TIMESTAMP}.tar.gz"

tar -czf "$BACKUP_FILE" -C /opt/data skills/ 2>/dev/null
log "Created backup: backup_${TIMESTAMP}.tar.gz"

# If repo exists, sync it
if [ -d "$REPO_DIR/.git" ]; then
    cd "$REPO_DIR"
    # Copy latest skills to repo
    cp -r "$SKILLS_DIR"/* "$REPO_DIR/" 2>/dev/null
    cd "$REPO_DIR"
    git add -A 2>/dev/null
    if git diff --staged --quiet 2>/dev/null; then
        log "No changes to push"
    else
        git commit -m "Backup $(date '+%Y-%m-%d %H:%M')" 2>/dev/null
        git push origin main 2>/dev/null && log "Pushed to GitHub" || log "GitHub push failed - authentication needed"
    fi
else
    log "Repository not initialized - run: git clone https://github.com/kozuelam9z/hermes-agent-backup.git $REPO_DIR"
fi

log "Backup complete"