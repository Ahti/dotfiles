function fish_greeting
  set -l cow_dir /usr/local/opt/cowsay/share/cows/
  if begin which fortune >/dev/null
       and which cowsay >/dev/null
       and test -d $cow_dir
       end
    set -l cow_list (ls $cow_dir)
    set -l cow $cow_list[(math (random) \% (count $cow_list) + 1)]
    fortune -a | cowsay -f $cow
  end
  echo $fish_greeting
end
