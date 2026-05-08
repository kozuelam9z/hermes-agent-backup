# Hermes Agent Backup

Automated backup of all Hermes Agent skills and tools.

## Latest Backup
- **Date**: 2026-05-08 19:29:54
- **Skills**: 104 skill directories
- **File**: backup_20260508_192954.tar.gz

## Backup Archives
All backups are timestamped tar.gz archives of /opt/data/skills/

## Restore
```bash
tar -xzf backup_YYYYMMDD_HHMMSS.tar.gz
```

## Auto-Backup
Cron job runs hourly at minute 0. Pushes new backups to this repo automatically.
