#!/bin/bash -eu

: ${DIR:='/usr/local/bin'}
[ "$(ls -ld ${DIR} | cut -d' ' -f3)" != "${USER}" ] && SUDO='sudo' || SUDO=''
for cmd in anyrc sshrc dockerrc kubectlrc surc; do
  ${SUDO} curl -sSL "https://github.com/amaya382/anyrc/raw/master/${cmd}" -o "${DIR}/${cmd}"
  ${SUDO} chmod +x "${DIR}/${cmd}"
done

if [ -e "${HOME}/.anyrc" ]; then
  if [ ! -z "${FORCE:+_}" ]; then
    echo "Override ${HOME}/.anyrc"
  else
    SKIP_DANYRC=1
    echo "Skip ${HOME}/.anyrc"
  fi
fi

[ -z "${SKIP_DANYRC:+_}" ] \
  && curl -sSL https://github.com/amaya382/anyrc/raw/master/example/.anyrc \
      -o ~/.anyrc
mkdir -p "${HOME}/.anyrc.d"

cat << EOS
anyrc was installed under ${DIR}!
Put your dotfiles into ${HOME}/.anyrc.d. Symlinks are allowed.
EOS

