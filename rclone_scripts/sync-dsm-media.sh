# #!/bin/bash

# # Set the source and destination directories
# source="/mydata/proxmox/data"
# destination="DSM:/data"

# # Set the log file
# log_file="rclone_sync_media.log"


# echo "#############################################"
# echo "#############################################"

# # Add a timestamp to the log file
# echo "Sync started at $(date)" >> $log_file

# # Run the sync command and redirect output to the log file
# rclone sync $source $destination --verbose --log-file=$log_file

# # Add a timestamp to the log file
# echo "Sync completed at $(date)" >> $log_file
