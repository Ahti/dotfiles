function fish_greeting
	set -l cow_dir /usr/local/opt/cowsay/share/cows/
	set -l cow_list (ls $cow_dir)
    set -l cow $cow_list[(math (random) \% (count $cow_list) + 1)]
	fortune -a | cowsay -f $cow
    echo $fish_greeting
end
