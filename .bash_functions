taar () {
  terraform apply -auto-approve -replace=$1
}

taat () {
  terraform apply -auto-approve -target=$1
}