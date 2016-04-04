#!/usr/bin/env bash
#
# Remove credentials stored using the credential helpers
#
# Usage: git adsk teardown
#
set -e

KIT_PATH=$(dirname "$0")
. "$KIT_PATH/lib/setup_helpers.sh"

function remove_credentials () {
    local HOST=$1
    local HELPER=$(credential_helper)
    printf "protocol=https\nhost=$HOST\n\n" | git credential-$HELPER erase
}

remove_credentials '<< YOUR GITHUB SERVER >>>'

print_kit_header
print_success 'Git credentials successfully removed!'
