#!/bin/sh
set -e

KEYRING_PATH="/usr/share/keyrings/openskydimo-archive-keyring.asc"
REPO_URL="https://chanuka-williams.github.io/openskydimo-apt"

echo "Adding OpenSkydimo apt repository..."

curl -fsSL "${REPO_URL}/openskydimo-archive-keyring.gpg.asc" | \
    tee "${KEYRING_PATH}" > /dev/null

echo "deb [signed-by=${KEYRING_PATH}] ${REPO_URL} stable main" | \
    tee /etc/apt/sources.list.d/openskydimo.list > /dev/null

apt update

echo "Done. Install with: sudo apt install openskydimo"