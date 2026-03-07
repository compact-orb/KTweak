#!/usr/bin/env bash

BRANCHES=(balance budget latency throughput)
SCRIPT_NAME="ktweak"
SCRIPT_PATH="$SCRIPT_NAME"

rm -rf KTweak-MM*.zip

for branch in ${BRANCHES[@]}
do
	echo " * Building $branch..."
	TIMESTAMP="$(date +%F_%M-%H-%S)"
	HASH="$(git rev-parse HEAD)"
	ZIP="KTweak-MM-${branch}_${TIMESTAMP}_${HASH}.zip"

	echo " * Checking out script..."
	git show "$branch":"$SCRIPT_NAME" > "$SCRIPT_PATH"

	echo " * Patching for Android..."
	sed -i 's|!/usr/bin/env bash|!/system/bin/sh|g' "$SCRIPT_PATH"

	echo

	zip -9 -r -ll "$ZIP" META-INF/ build.sh customize.sh module.prop service.sh "$SCRIPT_NAME"
done

echo " * Done!"
