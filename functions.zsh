function rm() {
  scmpuff exec --relative -- rm "$@"
}

function vim() {
  scmpuff exec --relative -- vim "$@"
}

function cat() {
  scmpuff exec --relative -- bat "$@"
}

function gsp() {
  scmpuff exec -- git stash push "$@"
}
