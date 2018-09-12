# Defined in - @ line 2
function scp
	for i in (seq 1 (count $argv))
        if set s (string split : $argv[$i])
            set argv[$i] $s[1]:(string escape $s[2])
        end
    end
    command scp $argv
end
