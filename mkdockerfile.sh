#!/bin/bash

DOCKERFILE_HOME=$HOME/dockerfiles
is_interactive=1

function print_message() {
  # ERROR=3,WARNING=2,INFO=1,DEBUG=0
  local severity=$1
  local message=$2
  local header=""

  case $severity in
    0 ) header="DEBUG";;
    1 ) header="INFO";;
    2 ) header="WARNING";;
    3 ) header="ERROR";;
  esac

  if [ $severity -gt 1 ];then
    echo "$header: $message"
  else
    >&2 echo "$header: $message"
  fi

}

function create_dockerfile_directories() {
  if [ ! -d $DOCKERFILE_HOME ]; then
    mkdir $DOCKERFILE_HOME
  fi

  for dockerfile in ${dockerfiles_to_create[@]}; do
    create_dockerfile $dockerfile
  done
}

function create_dockerfile() {
  local dockerfile_to_create=$1
  local target_directory=$DOCKERFILE_HOME/$dockerfile_to_create

  if [ ! -d $target_directory ]; then
    mkdir $target_directory
  fi

  write_dockerfile $target_directory
}

function write_dockerfile() {
  local target_directory=$1

  if [ ! "$(ls -A $target_directory)" ]; then
    # Empty
    touch "$target_directory/Dockerfile"
  else
    # Not empty
    print_message 3 "The directory specified: $target_directory, is not empty. Please check and try again."
    exit 1
  fi
}

function print_usage() {
  echo "Usage: mkdockerfile.sh [OPTION]... [DOCKERFILE]..."
  echo "Creates a starter Dockerfile(s) in \$HOME/dockerfiles."
  echo ""
  echo "Options:"
  echo "  -y  Assume Yes to all queries and do not prompt"
  echo "  -h  Prints the usage"
  echo "Examples: "
  echo ""
  echo ""
}

OPTIONS=":yh"

while getopts $OPTIONS opt; do
  case $opt in
    y  ) is_interactive=0;;
    h  ) print_usage; exit 0;;
    \? ) echo "Invalid option: -$OPTARG" >&2; exit 1;;
    :  ) echo "Option -$OPTARG requires an argument." >&2; exit 1;;
  esac
done

shift $(($OPTIND - 1))

dockerfiles_to_create=( "$@" )

if [ "${#dockerfiles_to_create[@]}" -eq 0 ]; then
  print_message 3 "You must provide at least the name of one Dockerfile directory to create."
  print_usage
  exit 1
fi

create_dockerfile_directories

exit 0
