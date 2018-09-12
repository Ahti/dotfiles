function retry
	while not eval $argv
		echo Retrying!
	end
end
