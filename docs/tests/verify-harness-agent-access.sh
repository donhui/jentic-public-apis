#!/usr/bin/env bash
# Verification test: confirm harness agent can access repo contents via gh API
# without a local clone (skip_github_pull=true).
#
# Usage: bash docs/tests/verify-harness-agent-access.sh

set -uo pipefail

REPO="jentic/jentic-public-apis"
PASS=0
FAIL=0

check() {
  local desc="$1"
  shift
  if output=$("$@" 2>&1); then
    echo "PASS: $desc"
    PASS=$((PASS + 1))
  else
    echo "FAIL: $desc"
    echo "  $output"
    FAIL=$((FAIL + 1))
  fi
}

echo "=== Harness Agent Access Verification ==="
echo "Repository: $REPO"
echo ""

# 1. Can read repo metadata
check "Read repo metadata" \
  gh api "repos/$REPO" --jq '.full_name'

# 2. Can list top-level tree
check "List repo tree (top-level)" \
  gh api "repos/$REPO/git/trees/main" --jq '.tree | length'

# 3. Can read a specific file (AGENTS.md)
check "Read file contents (AGENTS.md)" \
  gh api "repos/$REPO/contents/AGENTS.md" --jq '.name'

# 4. Can list issues
check "List issues" \
  gh api "repos/$REPO/issues?per_page=1" --jq '.[0].number'

# 5. Can read issue #21741 specifically
check "Read issue #21741" \
  gh api "repos/$REPO/issues/21741" --jq '.title'

echo ""
echo "=== Results: $PASS passed, $FAIL failed ==="

if [ "$FAIL" -gt 0 ]; then
  exit 1
fi
