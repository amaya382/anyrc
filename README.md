<h1 align="center">anyrc</h1>

Bring your `.bashrc`, `.zshrc`, `.vimrc`, etc. into any remote environments, such as ssh, docker container (`docker exec`/`kubectl exec`), and other user (`su`).


## :soon: Usage
Just use `*rc` commands instead of original commands

* `sshrc xxx` instead of `ssh xxx`
  * e.g., `sshrc -p 10022 foo@XXX.XXX.XXX.XXX`
* `surc xxx` instead of `su xxx`
  * e.g., `surc foo`
* `dockerrc xxx` instead of `docker exec xxx`
  * e.g., `dockerrc foo_container bash`
* `kubectlrc xxx` instead of `kubectl exec xxx`
  * e.g., `kubectlrc foo_pod zsh`

### Setup
```sh
# will be installed into /usr/local/bin
curl -L https://github.com/amaya382/anyrc/raw/master/install.sh | DIR=/usr/local/bin bash

# Put your dotfiles or create symlinks of them into $HOME/.anyrc.d
ln -s /path/to/your/dotfiles/.dotfile $HOME/.anyrc.d/.dotfile
```


### Options
* `ANYRC_DANYRC`: Path to `.anyrc`. Default is in home dir or curr dir
* `ANYRC_DANYRCD`: Path to `.anyrc.d`. Default is in home dir or curr dir
* `ANYRC_DOCKER_WO_TAR`: If set, will work w/o `tar` on dockerrc


## Customize
### Config files
* `.anyrc`: Pre-configured for zsh, bash, tmux, and vim. If you want to support another tool, edit me.
* `.anyrc.d/*`: Dotfiles you want to bring into remote. Symlinks are allowed.

### Environment variables (in `.anyrc` and `.anyrc.d/*`)
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
* etc.


## :bow: Acknowledgement
* [Russell91/sshrc](https://github.com/Russell91/sshrc)
  * Using a lot of logics and codes from sshrc