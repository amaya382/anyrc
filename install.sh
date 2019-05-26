#!/bin/sh -eu

DIR='/usr/local/bin'
for cmd in anyrc sshrc dockerrc kubectlrc surc; do
  curl "https://github.com/amaya382/anyrc/raw/master/${cmd}" > "${DIR}/${cmd}"
  chmod +x "${DIR}/${cmd}"
done

curl https://github.com/amaya382/anyrc/raw/master/example/.anyrc > "${HOME}/.anyrc"
mkdir -p "${HOME}/.anyrc.d"

cat << EOS
anyrc was installed!
Put your dotfiles into \`${HOME}/.anyrc.d\`. Symlinks are allowed.
EOS

