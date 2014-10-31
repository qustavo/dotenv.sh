cd()
{
	loadenv()
	{
		for i in $(cat $1); do
			export $i
		done
	}

	builtin cd $@
	if [ -e .env ]; then
		loadenv .env
	fi
}