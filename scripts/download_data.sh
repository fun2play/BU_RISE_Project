#!/usr/bin/env bash
set -euo pipefail

# 1. Figure out where this script lives, so we can reference data/ next to it
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 2. Repo info
REPO="https://github.com/OpenNeuroDatasets/ds004100.git"
COMMIT="da07f99"

# 3. Where we want the dataset
TARGET_DIR="${SCRIPT_DIR}/data/ds004100"

# 4. Make sure data/ exists
mkdir -p "${SCRIPT_DIR}/data"

if [[ -d "${TARGET_DIR}/.git" ]]; then
  echo "→ Dataset already cloned. Updating to ${COMMIT}…"
  cd "${TARGET_DIR}"
  git fetch origin
  git checkout "${COMMIT}"
  cd - >/dev/null
else
  echo "→ Cloning dataset into ${TARGET_DIR}…"
  git clone "${REPO}" "${TARGET_DIR}"
  cd "${TARGET_DIR}"
  git checkout "${COMMIT}"
  cd - >/dev/null
fi

cd "${TARGET_DIR}"
git annex get .

echo "Dataset ready at ${TARGET_DIR}"