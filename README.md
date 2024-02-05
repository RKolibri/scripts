# Scripts

`Docker` , `Portainer` , `Starship prompt` , `Rclone` scripts

## Project Structure !

- `config_folder/`
  - [`starship.toml`](https://github.com/RKolibri/scripts/blob/main/config_folder/starship.toml)
- `custom_scripts/`
  - [`install_docker.sh`](https://github.com/RKolibri/scripts/blob/main/custom_scripts/install_docker.sh)
  - [`install_starship.sh`](https://github.com/RKolibri/scripts/blob/main/custom_scripts/install_starship.sh)
  - [`update_lxcs.sh`](https://github.com/RKolibri/scripts/blob/main/custom_scripts/update_lxcs.sh)
- `rclone_scripts/`
  - [`sync_dsm-myfiles.sh`](https://github.com/RKolibri/scripts/blob/main/rclone_scripts/sync_dsm-myfiles.sh)
  - [`sync_dsm-otherstuff.sh`](https://github.com/RKolibri/scripts/blob/main/rclone_scripts/sync_dsm-otherstuff.sh)
  - [`sync_dsm-vm.sh`](https://github.com/RKolibri/scripts/blob/main/rclone_scripts/sync_dsm-vm.sh)
  - [`sync_ionos-myfiles.sh`](https://github.com/RKolibri/scripts/blob/main/rclone_scripts/sync_ionos-myfiles.sh)
  - [`sync_ionos-vm.sh`](https://github.com/RKolibri/scripts/blob/main/rclone_scripts/sync_ionos-vm.sh)


## Docker and Portainer Install

The `custom_scripts` directory contains the `install_docker.sh` script for installing Docker and Portainer. The user can choose to install either the CE or EE version of Portainer.

## starship prompt

The `custom_scripts` directory contains the `install_starship.sh` script for installing the [starship prompt](https://starship.rs/). The script also adds my configuration from the `configs_folder/starship.toml` directory.

## rclone scripts

The `rclone_scripts` directory contains scripts for syncing with  WebDAV remotes using rclone.

## Other scripts

The `custom_scripts` directory also contains a script `update_lxcs.sh` for updating LXC containers in Proxmox the script credit goes to the [tteck](https://github.com/tteck/Proxmox).

### More coming soon..!