#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)

CODEX_TARGET="$HOME/.codex/skills"
CLAUDE_CODE_TARGET="${CLAUDE_CODE_SKILLS_DIR:-}"
GITHUB_COPILOT_TARGET="${GITHUB_COPILOT_SKILLS_DIR:-}"

link_entry() {
  src=$1
  dest=$2

  if [ -L "$dest" ] || [ -e "$dest" ]; then
    rm -rf "$dest"
  fi

  ln -s "$src" "$dest"
}

install_tree() {
  agent_name=$1
  target_dir=$2
  overrides_dir=$3

  if [ -z "$target_dir" ]; then
    printf 'skip: %s target is not configured\n' "$agent_name"
    return
  fi

  mkdir -p "$target_dir"

  for entry in "$REPO_ROOT"/skills/shared/*; do
    if [ ! -e "$entry" ]; then
      continue
    fi

    name=$(basename "$entry")
    link_entry "$entry" "$target_dir/$name"
  done

  for entry in "$overrides_dir"/*; do
    if [ ! -e "$entry" ]; then
      continue
    fi

    name=$(basename "$entry")
    link_entry "$entry" "$target_dir/$name"
  done

  printf 'installed: %s -> %s\n' "$agent_name" "$target_dir"
}

install_tree "codex" "$CODEX_TARGET" "$REPO_ROOT/skills/codex/overrides"
install_tree "claude-code" "$CLAUDE_CODE_TARGET" "$REPO_ROOT/skills/claude-code/overrides"
install_tree "github-copilot" "$GITHUB_COPILOT_TARGET" "$REPO_ROOT/skills/github-copilot/overrides"

if [ -z "$CLAUDE_CODE_TARGET" ]; then
  printf 'note: set CLAUDE_CODE_SKILLS_DIR to enable Claude Code skill linking\n'
fi

if [ -z "$GITHUB_COPILOT_TARGET" ]; then
  printf 'note: set GITHUB_COPILOT_SKILLS_DIR to enable GitHub Copilot skill linking\n'
fi
