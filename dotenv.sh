#!/usr/bin/env 

dotenv_machine_uname="$(uname -s)"
case "${unameOut}" in
    Linux*)     dotenv_machine=Linux;;
    FreeBSD*)   dotenv_machine=FreeBSD;;
    Darwin*)    dotenv_machine=Mac;;
    CYGWIN*)    dotenv_machine=Cygwin;;
    MINGW*)     dotenv_machine=MinGw;;
    *)          dotenv_machine="${dotenv_machine_uname}"
esac

cd()
{
	debug()
	{
		if [ "$DOTENVSH_DEBUG" = true ]; then
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
	ERR=$?

	if [ $ERR -ne 0 ]
	then
		return $ERR
	fi



	if [ -e .env.${dotenv_machine} ]; then
		loadenv .env.${dotenv_machine}
	else
		if [ -e .env ]; then
			loadenv .env
		fi
	fi
}
