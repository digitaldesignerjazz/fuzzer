#!/usr/bin/env bash
#
# fuzz.sh - Runner for cargo-fuzz targets (copied from framed-message-protocol)

set -euo pipefail

TARGET=${1:-decode_raw}
DURATION=${2:-}

cd "$(dirname "$0")/fuzz" || exit 1

if ! command -v cargo-fuzz &> /dev/null; then
    echo "Installing cargo-fuzz..."
    cargo install cargo-fuzz
fi

CMD=(cargo +nightly fuzz run "$TARGET")

if [[ -n "$DURATION" ]]; then
    SECONDS=$(( DURATION * 60 ))
    CMD+=(-- -max_total_time="$SECONDS")
fi

exec "${CMD[@]}"