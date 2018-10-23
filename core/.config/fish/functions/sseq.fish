# Defined in - @ line 2
function sseq
	set alph 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
    set left (string split " " (string match -rn $argv[1] $alph))[1]
    set right (string split " " (string match -rn $argv[2] $alph))[1]
    string sub -s $left -l (math $right - $left + 1) $alph
end
