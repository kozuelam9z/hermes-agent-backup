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

### Classic PAT (Recommended)
Go to https://github.com/settings/tokens/new, select "Classic", check `☑ repo`, generate.
Works for: creating repos, pushing to any repo, full API access.

### Fine-Grained PAT (Limited)
Must be granted access to EACH repository individually via repo Settings → Collaborators.
CANNOT create new repos via API. Only works for repos explicitly authorized.
Symptoms of misconfiguration: `403 Write access denied` or `404 Not Found`.

### SSH Key
Works if `ssh` and `ssh-keygen` are available. No token needed.
```bash
ssh-keygen -t ed25519 -C "backup@hermes"
# Add public key to GitHub Settings → SSH keys
```

### git credential helper
```bash
git config --global credential.helper store
```

## Repo Must Exist First
With Fine-Grained PATs and SSH: **the repository must already exist on GitHub before pushing**.
Classic PATs can create repos via API:
```bash
curl -u USERNAME:TOKEN -X POST https://api.github.com/user/repos \
  -d '{"name":"hermes-agent-backup","private":false}'
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
- **Fine-grained PAT + non-existent repo** = 403 error. Fine-grained PATs cannot create repos. Workaround: create repo manually first, or use Classic PAT.
- **No SSH available** = SSH push fails. Check `which ssh` before attempting SSH-based push.
- **Large skill directories** → use tar compression to save space
- **Concurrent backups** → use lock file to prevent overlap
- **.netrc with PAT in URL** → security scanners flag it. Better to use credential helper or git config with token.

## Quick Start (Tested Flow)
```bash
# 1. Authenticate
git config --global credential.helper store
echo "machine github.com login <USER> password <TOKEN>" > ~/.netrc
chmod 600 ~/.netrc

# 2. Create local backup repo
mkdir -p /opt/data/hermes-agent-backup && cd /opt/data/hermes-agent-backup
git init && git config user.email "backup@hermes" && git config user.name "Hermes Backup"

# 3. Copy skills
cp -r /opt/data/skills/* .
cp /opt/data/skill-backups/*.tar.gz . 2>/dev/null
cp /opt/data/scripts/skill-monitor.sh . 2>/dev/null

# 4. Commit
git add -A && git commit -m "Backup $(date '+%Y-%m-%d')"

# 5. Push (repo must exist)
git remote add origin https://github.com/kozuelam9z/hermes-agent-backup.git
git push -u origin main
```