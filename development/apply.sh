#!/usr/bin/env bash
set -euo pipefail

project_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_root"

apply_patch() {
    local source_dir="$1"
    local patch_file="$project_root/development/patches/$2"

    if git -C "$source_dir" apply --check "$patch_file" 2>/dev/null; then
        git -C "$source_dir" apply "$patch_file"
        echo "Applied: $2"
    elif git -C "$source_dir" apply --reverse --check "$patch_file" 2>/dev/null; then
        echo "Already applied: $2"
    else
        echo "Cannot apply $2; check source revisions and local changes." >&2
        return 1
    fi
}

apply_patch plutosdr-fw firmware.patch
apply_patch plutosdr-fw/hdl hdl.patch
apply_patch plutosdr-fw/linux linux.patch
apply_patch plutosdr-fw/u-boot-xlnx u-boot.patch
