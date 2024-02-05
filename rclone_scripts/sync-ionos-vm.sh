# #!/bin/bash

# # Set the source and destination directories
# source="/mydata/proxmox/dump"
# destination="ionos:/users/kolibri96/VM-LXC"

# #echo 2 rows with # symbol

# echo "#############################################" >> $log_file
# echo "#############################################" >> $log_file

# # Set the log file
# log_file="rclone_sync_ionos_vm.log"

# # Add a timestamp to the log file
# echo "Sync started at $(date)" >> $log_file

# # Run the sync command and redirect output to the log file
# rclone sync $source $destination --verbose --log-file=$log_file

# # Add a timestamp to the log file
# echo "Sync completed at $(date)" >> $log_file
