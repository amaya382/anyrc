#!/bin/bash -eu

: ${DIR:='/usr/local/bin'}
[ "$(ls -ld ${DIR} | cut -d' ' -f3)" != "${USER}" ] && SUDO='sudo' || SUDO=''
echo "Installing anyrc commands into ${DIR}..."
for cmd in dockrc kuberc; do
  ${SUDO} rm "${DIR}/${cmd}" # Remove old commands
done
for cmd in anyrc sshrc dockerexecrc dockerrunrc kubectlexecrc surc; do
  ${SUDO} curl -sSL "https://github.com/amaya382/anyrc/raw/master/${cmd}" -o "${DIR}/${cmd}"
  ${SUDO} chmod +x "${DIR}/${cmd}"
done

if [ -e "${HOME}/.anyrc" ]; then
  if [ ! -z "${FORCE:+_}" ]; then
    echo "Override ${HOME}/.anyrc"
  else
    SKIP_DANYRC=1
    echo "Skip installing .anyrc (If you want to install, install again w/ FORCE=1)"
  fi
fi

if [ -z "${SKIP_DANYRC:+_}" ]; then
  echo "Installing ${HOME}/.anyrc..."
  curl -sSL https://github.com/amaya382/anyrc/raw/master/example/.anyrc \
    -o ~/.anyrc
fi
echo "Creating ${HOME}/.anyrc.d..."
mkdir -p "${HOME}/.anyrc.d"

cat << EOS
anyrc was successfully installed!
Put your dotfiles into ${HOME}/.anyrc.d. Symlinks are allowed.
EOS

