#!/bin/bash
set -e
set -o pipefail

REPO_URL="${REPO_URL:-adriagalin}"

main(){
	IFS=$'\n'
	files=( $(find -L . -iname '*Dockerfile' | sed 's|./||' | sort) )
	unset IFS

  for df in $files
  do
	  image=${df%Dockerfile}
	  base=${image%%\/*}
    build_dir=$(dirname $df)
	  suite=${build_dir##*\/}
    if [[ -z "$suite" ]] || [[ "$suite" == "$base" ]]; then
		  suite=latest
	  fi
    docker build --rm --force-rm -t ${REPO_URL}/${base}:${suite} ${build_dir}
    docker push --disable-content-trust=true ${REPO_URL}/${base}:${suite}
  done
}

main
