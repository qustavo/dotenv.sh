# dotenv.sh

> Loads environment variables from `.env` in your shell
 
## Installation
```sh
$ wget https://raw.githubusercontent.com/gchaincl/dotenv.sh/master/dotenv.sh -O ~/.dotenv.sh
```
Add the following to your `.bashrc`, `.zshrc` or `.<whatever>rc`:
```sh
source ~/.dotenv.sh
```

## Usage
Each time you `cd` to a directory, dotenv.sh will try to load a `.env` file and export it's content

## TODO
* Unload loaded variables when you exit directory
* Optional variable overwriting
