# #!/bin/bash

# # Set the source and destination directories
# source="/mydata/proxmox/dump"
# destination="DSM:/4TB/ProxmoxVms"

# # Set the log file
# log_file="rclone_sync-dsm-vm.log"

# #echo 2 rows with # symbol

# echo "#############################################" >> $log_file
# echo "#############################################" >> $log_file
# # Add a timestamp to the log file
# echo "Sync started at $(date)" >> $log_file

# # Run the sync command and redirect output to the log file
# rclone sync $source $destination --verbose --log-file=$log_file

# # Add a timestamp to the log file
# echo "Sync completed at $(date)" >> $log_file
