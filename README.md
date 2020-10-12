<h1 align="center">:shell: anyrc</h1>

Bring your `.bashrc`, `.zshrc`, `.vimrc`, etc. into any remote environments, such as `ssh`, docker container (`docker run` / `docker exec` / `kubectl exec`), and another user (`su`).


## :soon: Usage
Just use `*rc` commands instead of original commands

* `sshrc xxx` instead of `ssh xxx`
  * e.g., `sshrc -p 10022 foo@XXX.XXX.XXX.XXX`
* `surc xxx` instead of `su xxx`
  * e.g., `surc foo`
* `dockerrc exec -it xxx` instead of `docker exec -it xxx`
  * e.g., `dockerrc exec -it foo_running_container bash`
* `dockerrc run -it xxx` instead of `docker run -it xxx`
  * e.g., `dockerrc run -it foo_image bash`
* `kubectlrc exec -it xxx` instead of `kubectl exec -it xxx`
  * e.g., `kubectlrc exec -it foo_running_pod -- zsh`

**Note**: Incompatible subcommands (e.g., `ps` for `dockerrc`) will be passed to the original command (i.e., `docker ps` will be executed).


### Setup/Upgrade
```sh
# If you want to install the latest version, change version to master in the url and set VERSION
# VERSION: anyrc version (default: same as install script version)
# DIR: Where to install (default: /usr/local/bin)
# FORCE: If defined, override .anyrc (default: undefined)
## default installation example
curl -sS https://raw.githubusercontent.com/amaya382/anyrc/0.1.0/install.sh | bash
## fully-customized installation example
curl -sS https://raw.githubusercontent.com/amaya382/anyrc/master/install.sh | VERSION=master DIR=~/.local/bin FORCE=1 bash

# Put your dotfiles or create symlinks of them into $HOME/.anyrc.d
ln -s /path/to/your/dotfiles/.somedotfile $HOME/.anyrc.d/.somedotfile
```

See [example](./example) as well.


### More options
* `ANYRC_DANYRC`: Path to `.anyrc`. Default is in home dir or curr dir
* `ANYRC_DANYRCD`: Path to `.anyrc.d`. Default is in home dir or curr dir
* `ANYRC_SSH_CMD`: `ssh` command, i.e., you can use `autossh` instead
* `ANYRC_DOCKER_WO_TAR`: If set, will work w/o `tar` on `dockerrc`
* `ANYRC_K8S_WO_TAR`: If set, will work w/o `tar` on `kubectlrc`
* `ANYRC_WO_TAR`: If set, will work w/o `tar` on any remote environment

```sh
# sshrc will use autossh internally
ANYRC_SSH_CMD=autossh sshrc user@host
```


## Customize
### Config files
* `.anyrc`: Pre-configured for zsh, bash, tmux, git, and vim. If you want to support other tools, edit me.
* `.anyrc.d/*`: Dotfiles you want to bring into remote. Symlinks are allowed.

### Available environment variables (in `.anyrc` and `.anyrc.d/*`)
* `ANYRC_ENV`: Show remote environment (`ssh`/`su`/`docker`/`k8s`)
* `ANYRC_ROOT`: Path to tmp dir including all anyrc-related files each connection
* `ANYRC_HOME`: Path to dir for dotfiles
* `ANYRC_DANYRC`: Path to `.anyrc`
* `ANYRC_DANYRCD`: Path to `.anyrc.d`

### Examples
See [example](./example)

### Completion
#### zsh
```sh
compdef dockerrc=docker
compdef kubectlrc=kubectl
```


## :trident: Features
### Supported remote environments
* `ssh`
  * Attach w/ a login shell
* `docker run`
  * Attach w/ a specified shell
* `docker exec`
  * Attach w/ a specified shell
* `kubectl exec`
  * Attach w/ a specified shell
* `su` (work w/ `sudo`)
  * Attach w/ a login shell

### Supported tools
* zsh
* bash
* tmux
* vim
* git
* etc. (can support other tools by editing `.anyrc`)


## :bow: Acknowledgement
* [Russell91/sshrc](https://github.com/Russell91/sshrc)
  * Using a lot of logics and codes from sshrc
