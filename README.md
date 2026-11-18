# AWS EC2 Monitoring & Automated Backup

Live EC2 website with CloudWatch monitoring and daily automated backups to S3.

## Project 4: Automated Backups

**What it does:**
- Backs up website files to S3 every day at 2am
- Uses cron job: `0 2 * * * /home/ec2-user/backup.sh`
- Keeps a `latest/` copy + dated backups like `backup-2026-11-18/`
- Logs every run to `backup.log`

**Files:**
- `backup.sh` - backup script that syncs to S3
- S3 Bucket: `aviwe-backup-2026`

**How to verify:**
```bash
crontab -l
cat /home/ec2-user/backup.log
aws s3 ls s3://aviwe-backup-2026/
