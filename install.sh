#!/bin/bash -eu

: ${DIR:='/usr/local/bin'}
[ "$(ls -ld ${DIR} | cut -d' ' -f3)" != "${USER}" ] && SUDO='sudo' || SUDO=''
for cmd in anyrc sshrc dockerrc kubectlrc surc; do
  ${SUDO} curl -sSL "https://github.com/amaya382/anyrc/raw/master/${cmd}" -o "${DIR}/${cmd}"
  ${SUDO} chmod +x "${DIR}/${cmd}"
done

curl -sSL https://github.com/amaya382/anyrc/raw/master/example/.anyrc -o "${HOME}/.anyrc"
mkdir -p "${HOME}/.anyrc.d"

cat << EOS
anyrc was installed!
Put your dotfiles into \`${HOME}/.anyrc.d\`. Symlinks are allowed.
EOS

