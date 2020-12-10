PROXY_SERVER=127.0.0.1
alias proxy='\
	export http_proxy=http://$PROXY_SERVER:10809 ;\
	export https_proxy=http://$PROXY_SERVER:10809 ;\
	export ftp_proxy=http://$PROXY_SERVER:10809 '
alias unproxy='unset http_proxy https_proxy ftp_proxy'


alias adbw='adb wait-for-device'
alias shortd='export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "'
alias unshortd='export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "'

alias reposync='repo sync -cd --no-tags --no-clone-bundle -j8'
alias reporeset='repo forall -vc "git reset --hard && git clean -fd"'

# alias rpi='docker exec -it rpi bash'
alias opengrok='docker exec -it -w /var/opengrok/src opengrok sh'
alias heart='docker exec -it heart bash'

