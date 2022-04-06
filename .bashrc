
# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

cat <<EOS >$HOME/.gitconfig
[push]
        default = simple
[alias]
        lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
[credential]
        helper = /usr/bin/gp credential-helper
[user]
        name = ${GITPOD_GIT_USER_NAME}
        email = ${GITPOD_GIT_USER_EMAIL}
EOS
