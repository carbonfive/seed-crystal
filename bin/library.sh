command_exists() {
	command -v "$@" >/dev/null 2>&1
}

error() {
    echo "${RED}""Error: $*""${RESET}" >&2
}

warn() {
    echo "${YELLOW}""$*""${RESET}" >&2
}

announce() {
    echo "${BLUE}""$*""${RESET}" >&2
}

success() {
    echo "${GREEN}""$*""${RESET}" >&2
}

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		RESET=""
	fi
}

add_line_to_file() {
  line=$1
  file=$2

  echo
  if grep --fixed-strings --line-regexp --quiet "$line" $file
  then
    echo "SKIPPING: '$line' already exists in '$file'"
  else
    echo "Adding '$line' to '$file'"

    echo "$line" >> $file
  fi
}

cache_root_password {
    warn Caching root password...
    sudo -K
    sudo true;
}