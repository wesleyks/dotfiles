#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

sh "$SCRIPT_DIR/scripts/install-oh-my-zsh.sh"
sh "$SCRIPT_DIR/scripts/install-agent-skills.sh"
