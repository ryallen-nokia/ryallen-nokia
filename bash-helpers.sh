DEFAULT=$PS1
PS1="\[\e]0;\u \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \$ "

alias brc="source ~/.bashrc"

# git
# delete stale branches
alias prune="git remote prune origin"
alias fpush="git push --force-with-lease --no-verify"

# checkout branch or create it
gitSwitch() {
  git checkout $1 2>/dev/null || git checkout -b $1;
}

# keyboard backlight
# kb-light.py --> https://gist.github.com/danielkov/d19c1aa33d232cedc88264c1a86c7fe4
alias kbu="sudo python /usr/local/bin/kb-light.py +"
alias kbd="sudo python /usr/local/bin/kb-light.py -"

# ubuntu
# nightlight (1000 - 10000, def: 4000, off: 5500)
alias nightlight="gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature"

# ports
portCheck() {
    sudo lsof -i:$1 -n -P
}
portKill() {
    sudo kill -9 $(sudo lsof -t -i:4443)
}

#vpn
export VPN_PRIMARY="vpn_name"
vpn() {
  if ! nmcli con show --active | grep -i vpn;
  then
      echo 'VPN not Connected'
  fi
}
vpnUp() {
  if [ "$1" ]; then
    nmcli con up id $1
  else
    nmcli con up id $VPN_PRIMARY
  fi
}
vpnDown() {
  if [ "$1" ]; then
    nmcli con down id $1
  else
    nmcli con down id $VPN_PRIMARY
  fi
}
