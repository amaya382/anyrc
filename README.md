<h1 align="center">anyrc</h1>

Bring your `.bashrc`, `.zshrc`, `.vimrc`, etc. into any remote environments, such as `ssh`, docker container (`docker run` / `docker exec` / `kubectl exec`), and another user (`su`).


## :soon: Usage
Just use `*rc` commands instead of original commands

* `sshrc xxx` instead of `ssh xxx`
  * e.g., `sshrc -p 10022 foo@XXX.XXX.XXX.XXX`
* `surc xxx` instead of `su xxx`
  * e.g., `surc foo`
* `dockerrc exec xxx` instead of `docker exec xxx`
  * e.g., `dockerrc exec foo_running_container bash`
* `dockerrc run xxx` instead of `docker run -it xxx`
  * e.g., `dockerrc run foo_image bash`
* `kubectlrc exec xxx` instead of `kubectl exec xxx`
  * e.g., `kubectlrc exec foo_running_pod zsh`

**Note**: Incompatible subcommands (e.g., `ps` for `dockerrc`) will be passed to the original command (i.e., `docker ps` will be executed).


### Setup
```sh
# Will be installed into /usr/local/bin
# DIR: Where to install
# FORCE: Override .anyrc or not
curl -sSL https://github.com/amaya382/anyrc/raw/master/install.sh | DIR=/usr/local/bin bash

# Put your dotfiles or create symlinks of them into $HOME/.anyrc.d
ln -s /path/to/your/dotfiles/.dotfile $HOME/.anyrc.d/.dotfile
```


### Options
* `ANYRC_DANYRC`: Path to `.anyrc`. Default is in home dir or curr dir
* `ANYRC_DANYRCD`: Path to `.anyrc.d`. Default is in home dir or curr dir
* `ANYRC_SSH_CMD`: `ssh` command, i.e., you can use `autossh` instead
* `ANYRC_DOCKER_WO_TAR`: If set, will work w/o `tar` on `dockerrc`
* `ANYRC_K8S_WO_TAR`: If set, will work w/o `tar` on `kubectlrc`
* `ANYRC_WO_TAR`: If set, will work w/o `tar` on any remote environment


## Customize
### Config files
* `.anyrc`: Pre-configured for zsh, bash, tmux, and vim. If you want to support other tools, edit me.
* `.anyrc.d/*`: Dotfiles you want to bring into remote. Symlinks are allowed.

### Environment variables (in `.anyrc` and `.anyrc.d/*`)
* `ANYRC_ENV`: Show remote environment (`ssh`/`su`/`docker`/`k8s`)
* `ANYRC_ROOT`: Path to tmp dir including all anyrc-related files each connection
* `ANYRC_HOME`: Path to dir for dotfiles
* `ANYRC_DANYRC`: Path to `.anyrc`
* `ANYRC_DANYRCD`: Path to `.anyrc.d`

### Examples
See [example](https://github.com/amaya382/anyrc/tree/master/example)


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
* etc.


## :bow: Acknowledgement
* [Russell91/sshrc](https://github.com/Russell91/sshrc)
  * Using a lot of logics and codes from sshrc
