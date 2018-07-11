function demangle_files
	for f in $argv
set new_lines
for l in (cat $f)
set new_lines $new_lines ""
for w in (string split " " $l)
set new_lines[-1] $new_lines[-1](swift-demangle -compact $w)" "
end
end
string join \n $new_lines > $f.demangled
end
end
