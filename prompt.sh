if [ "$TERM" = emacs ]; then
  export PS1="\u@\h (\$?) \W\$ "
elif [ "$TERM" = xterm -o "$TERM" = gnome ]; then
  export PS1='$(e=$?; fo1="\u@\h:\w"; if [ $e -eq 0 ]; then echo -n "\[\e[32;40;7m\]\u@\h \W\[\e[m\]"; else echo -n "\[\e[31;40;7m\]\u@\h($e) \W\[\e[m\]"; fi; f=$(gitinfo); e=$?; br=${f%%/*}; pl=${f##*/}; un=${pl##*@}; pl=${pl%%@*}; if [ -n "$pl" ]; then plf="\[\e[33m\]$pl"; pl=" $pl"; else plf=""; fi; if [ -n "$un" ] && [ "$un" -ne 0 ]; then plf="${plf}\[\e[43;30m\][u$un]"; fi; if [ $e -lt 2 ]; then fo2=" - git: $br$pl"; if [ $e -eq 1 ]; then echo -n " \[\e[32m\]$br$plf\[\e[m\]"; fo2="$fo2 (unchanged)"; else echo -n " \[\e[31m\]$br$plf\[\e[m\]"; fo2="$fo2 (modified)"; fi; else fo2=""; fi; if [ -n "$un" ] && [ "$un" -ne 0 ]; then fo2="$fo2 ($un untracked)"; fi; echo -n "\$ \[\e]2;$fo1$fo2\a\]")'
else
  export PS1='$(e=$?; if [ $e -eq 0 ]; then echo -n "\[\e[32;40;7m\]\u@\h \W\[\e[m\]"; else echo -n "\[\e[31;40;7m\]\u@\h($e) \W\[\e[m\]"; fi; f=$(gitinfo); e=$?; if [ $e -lt 2 ]; then if [ $e -eq 1 ]; then echo -n " \[\e[32m\]$f\[\e[m\]"; else echo -n " \[\e[31m\]$f\[\e[m\]"; fi; fi; echo -n "\$ ")'
fi
