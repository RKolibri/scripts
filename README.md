## Dotfiles

Dotfiles are configuration files that are used to customize and personalize the settings of various programs and applications on a Unix-based system. These files typically have a `.` (dot) at the beginning of their names, which makes them hidden by default in most file browsers.

The dotfiles in this repository are used to configure my personal development environment on my Unix-based systems. It includes configuration files for the following programs:

- [bash](https://www.gnu.org/software/bash/)
- [vim](https://www.vim.org/)
- [tmux](https://tmux.github.io/)
- [git](https://git-scm.com/)

These dotfiles are meant to be used on a Unix-based system and have been tested on macOS and Linux.

## Installation

 To install these dotfiles, you can clone the repository and run the `install.sh` script (not done yet):
 ```bash
  git clone https://github.com/RKolibri/dotfiles.git
  cd dotfiles
  ./install.sh 
```
 
This will create symbolic links in your home directory that point to the files in the repository. Please backup any important files before running the install script as it will overwrite any existing dotfiles in your home directory.

## Contributions
If you have any suggestions or improvements, feel free to open a pull request or an issue.

## License
This repository is licensed under the MIT License.
