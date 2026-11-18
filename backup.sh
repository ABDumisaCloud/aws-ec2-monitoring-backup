#!/bin/bash
# Automated Backup Script - Project 4
# Backs up website to S3 daily via cron

DATE=$(date +%Y-%m-%d-%H%M)
BACKUP_DIR="/home/ec2-user/backup-$DATE"
S3_BUCKET="s3://aviwe-backup-2026"

echo "Starting backup: $DATE" >> /home/ec2-user/backup.log

# Create backup folder
mkdir -p $BACKUP_DIR
cp -r /var/www/html/* $BACKUP_DIR/ 2>/dev/null || cp -r /home/ec2-user/* $BACKUP_DIR/ 2>/dev/null

# Upload to S3
aws s3 sync $BACKUP_DIR $S3_BUCKET/backup-$DATE/
aws s3 sync $BACKUP_DIR $S3_BUCKET/latest/

# Cleanup local backup
rm -rf $BACKUP_DIR

echo "Backup completed: $DATE to $S3_BUCKET" >> /home/ec2-user/backup.log
