# Defined in - @ line 0
function uc --description 'alias uc systemctl --user'
	systemctl --user $argv;
end
