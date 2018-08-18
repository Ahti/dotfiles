# Defined in /tmp/fish.sNeGe7/scp.fish @ line 1
function scp
	for i in (seq 1 (count $argv))
if set s (string split : $argv[$i])
set argv[$i] $s[1]:(string escape $s[2])
end
end
/usr/bin/scp $argv
end
