#!/bin/bash

ROOT="${PWD}"
REPOSITORIES=(
    'system/sepolicy'
)

echo Reverting patches from patcher
for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"

	echo
	echo "In directory: $PWD"
	echo Aborting am
	git am --abort
	git reset --hard

	echo Checking out branch remotes/github/lineage-16.0
	git checkout remotes/github/lineage-16.0

	echo Cleaning up repo
	git clean -fd

    cd "${ROOT}"
done
