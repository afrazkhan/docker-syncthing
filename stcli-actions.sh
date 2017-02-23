#!/bin/bash

function get_id {
  echo $(/home/syncuser/go/bin/stcli id)
}

function join_node {
  /home/syncuser/go/bin/stcli folders set default rescan 2
  /home/syncuser/go/bin/stcli devices add $1
  /home/syncuser/go/bin/stcli folders devices add default $1
  /home/syncuser/go/bin/stcli restart
}

case $1 in
  'id')
    get_id
    ;;
  'join')
    join_node $2
    ;;
  *)
    echo "Usage: stcli-actions.sh id -- Get this node's ID"
    echo "       stcli-actions.sh join [ID] -- Join node 'ID' to this one"
  ;;
esac
