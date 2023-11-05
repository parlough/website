#!/bin/bash

# Fast fail the script on failures.
set -e

ROOT=$(pwd)
TEST=1

while [[ "$1" == -* ]]; do
  case "$1" in
    --filter)          shift; FILTER="$1"; shift;;
    --refresh|-r)      REFRESH=1; shift;;
    --no-test)         TEST=; shift;;
    --help|-h)         echo ""
                       echo "Analyze and test examples."
                       echo ""
                       echo "Usage: $(basename $0) [options]"
                       echo ""
                       echo "  -r, --refresh  Refresh code excerpts"
                       echo "      --filter   Filter examples by glob pattern"
                       echo "      --no-test  Don't run tests"
                       echo "  -h, --help     Print this usage information"
                       echo "";
                       exit 0;;
    *)                 echo "Unrecognized option: $1. Use --help for usage."; exit 0;;
  esac
done


# Write errors to stderr
function error() {
  echo $'\n'"ERROR: $@" 1>&2
}


echo "=> Using Dart version:"
dart --version

echo "=> Using Flutter version:"
flutter --version

if [[ $REFRESH ]]; then
  echo "=> Refreshing code excerpts..."
  TEMP_DIRECTORY=$(mktemp -d)
  (
    # Copy the non hidden fies in the src directory to a temp directory
    # so that we can diff the changes after refreshing code excerpts.
    rsync -a --exclude '_*' "$ROOT/src" "$TEMP_DIRECTORY"
    tool/refresh-code-excerpts.sh --keep-dart-tool
  ) || (
    # If there were excerpts needing updates,
    # compare the temp copied directory with the updated source directory.
    diff --no-dereference --exclude '_*' --color -U2 -r "$TEMP_DIRECTORY/src" "$ROOT/src" || :
    echo "=> ERROR: The above code excerpts needed to be updated!"
    rm -rf "$TEMP_DIRECTORY"
    exit 1
  )
  rm -rf "$TEMP_DIRECTORY"
fi
