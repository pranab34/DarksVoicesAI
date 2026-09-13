#!/bin/sh
# Gradle bootstrap wrapper. In CI, the workflow provisions Gradle 8.9.
if command -v gradle >/dev/null 2>&1; then exec gradle "$@"; fi
SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
DIST="$HOME/.gradle/wrapper/dists/gradle-8.9-bin"
if [ -x "$DIST/gradle-8.9/bin/gradle" ]; then exec "$DIST/gradle-8.9/bin/gradle" "$@"; fi
echo "Gradle 8.9 is required. Install/provision Gradle 8.9, then rerun." >&2
exit 1
