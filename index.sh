#!/usr/bin/env bash
main () {
  if [ $# -eq 0 ]
    then
      echo "usage: gh-deploy <source-dir> <target-dir>"
      exit
  fi
  if [ ! -d "$1" ]; then echo "Source directory does not exist"; exit; fi
  if [ ! -d "$2" ]; then echo "Target directory does not exist"; exit; fi
  declare from="$1" to="$2"
  local commit_msg=$(git log -1 --pretty=format:"%s from %h")
  rm -rf "$to"
  git submodule sync
  git submodule update --init
  cd "$to"
  git checkout gh-pages
  git pull
  cd ..
  rsync -azP --del --exclude={.git,CNAME,README.md,circle.yml} "$from" "$to"
  cd "$to"
  git add --all ./
  git commit -m "$commit_msg"
  git push origin gh-pages
}

main "$@"
