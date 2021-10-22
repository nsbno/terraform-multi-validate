#!/bin/bash
printf "Validating terraform code\n"
cd ${INPUT_PATH}
ls -al
dirs=""
if [ -z "$INPUT_DIRECTORIES" ]; then
    dirs=$(find -mindepth ${INPUT_MIN_DEPTH} -maxdepth ${INPUT_MAX_DEPTH} -type d)
else
    dirs=$INPUT_DIRECTORIES
fi
for i in ${dirs}; do
    (
    j=$(echo $i | sed 's/\(.*\),/\1 /')
    echo "env: $j"
    cd $j
    terraform init -backend=false && terraform validate
    )
done