cd()
{
	debug()
	{
		if [ $DOTENVSH_DEBUG = true ]; then
			echo $1
		fi
	}

	loadenv()
	{
		debug "Loading $1"
		for i in $(cat $1); do
			export $i
		done
	}

	builtin cd $@
	if [ -e .env ]; then
		loadenv .env
	fi
}