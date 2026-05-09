# Hermes Agent Backup

Automated backup of all Hermes Agent skills and tools.

## Latest Backup
- **Date**: 2026-05-09
- **Skills**: 104 skill directories
- **File**: backup_20260509.tar.gz

## Backup Archives
One backup per day. Filename format: `backup_YYYYMMDD.tar.gz`

## Restore
```
tar -xzf backup_YYYYMMDD.tar.gz -C /opt/data
```

## Auto-Backup
Cron job runs hourly. One backup per day — same filename is overwritten daily and pushed to this repo automatically.
