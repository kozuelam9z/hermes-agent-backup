---
name: skill-backup
description: Monitor skills directory for new or modified skills, create backups, and push to GitHub. Triggers on skill creation/update, archives all skills, and syncs to https://github.com/kozuelam9z/hermes-agent-backup
triggers:
  - new skill created in /opt/data/skills/
  - skill modified or updated
  - manual trigger for full backup
  - new tool integrated into Hermes Agent
---

# Skill Backup & GitHub Sync

## Overview
This skill monitors `/opt/data/skills/` for changes, creates timestamped backups, and pushes them to the GitHub repo `https://github.com/kozuelam9z/hermes-agent-backup`.

## Backup Process

### Step 1: Scan Skills Directory
```bash
SKILLS_DIR="/opt/data/skills"
BACKUP_DIR="/opt/data/skill-backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_PATH="${BACKUP_DIR}/backup_${TIMESTAMP}"

mkdir -p "${BACKUP_DIR}"
find "${SKILLS_DIR}" -type f -name "SKILL.md" -o -name "*.py" -o -name "*.sh" | head -100 > /tmp/skill_files.txt
wc -l < /tmp/skill_files.txt
```

### Step 2: Create Backup Archive
```bash
cd /opt/data
tar -czf "skill-backups/backup_${TIMESTAMP}.tar.gz" -C /opt/data skills/
echo "Backup created: backup_${TIMESTAMP}.tar.gz"
```

### Step 3: GitHub Push
Requires authentication (git credential helper, gh CLI, or token):
```bash
cd /opt/data/hermes-agent-backup
git add -A
git commit -m "Backup $(date +%Y-%m-%d\ %H:%M)"
git push origin main
```

## GitHub Authentication Setup
Use ONE of these methods:
1. **gh CLI**: `gh auth login`
2. **git credential helper**: `git config --global credential.helper store`
3. **Personal Access Token**: Store in `~/.netrc`:
   ```
   machine github.com
   login kozuelam9z
   password <TOKEN>
   ```

## Cron Job for Monitoring (Optional)
Create a recurring cron to check every hour:
```bash
0 * * * * /opt/data/scripts/skill-monitor.sh
```

## Verification
```bash
git -C /opt/data/hermes-agent-backup log --oneline -5
```

## Pitfalls
- No GitHub auth configured → backup runs locally but push fails
- Large skill directories → use tar compression to save space
- Concurrent backups → use lock file to prevent overlap