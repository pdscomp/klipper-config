#!/bin/bash 

exec_gcode() {
  script="$*"
  curl -X POST -H "Content-Type: application/json" -d "{\"script\":\"${script}\"}" ${gcode}
}

. ./rc.env

if [ $# -ne 0 ]; then
  exec_gcode $*
  echo
  exit 0
fi

while [ true ]; do
  read script
  exec_gcode $script
  #curl -X POST -H "Content-Type: application/json" -d "{\"script\":\"${input}\"}" ${gcode}
  echo
done
