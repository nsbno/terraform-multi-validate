#!/bin/bash
printf "Validating terraform code\n"

if [ -n "$INPUT_PATH" ]; then
  cd "${INPUT_PATH}" || echo "Invalid or no input path provided."
  echo "In directory $PWD"
fi

if [ -n "$INPUT_FOLDER" ]; then
  cd "$INPUT_FOLDER" || ( echo "Error, folder $INPUT_FOLDER not found."; exit 1 )
  echo "In directory $PWD"
  terraform init -backend=false && terraform validate
else
  dirs=""

  if [ -z "$INPUT_DIRECTORIES" ]; then
    dirs=$(find -mindepth "${INPUT_MIN_DEPTH}" -maxdepth "${INPUT_MAX_DEPTH}" -type d)
  else dirs=$INPUT_DIRECTORIES; fi

  for i in ${dirs}; do
    (
    j=$(echo "$i" | sed 's/\(.*\),/\1 /') # Remove comma for for-loop
    echo "Env: $j"
    cd "$j" || ( echo "Something went wrong when CDing into directory $j"; exit 1 )
    echo "In directory $PWD"
    terraform init -backend=false && terraform validate
    )
  done
fi