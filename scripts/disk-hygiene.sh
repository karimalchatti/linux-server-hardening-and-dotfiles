#!/usr/bin/env bash
set -euo pipefail

echo "=== Disk Usage Before ==="
df -h /
sudo apt-get autoremove -y
sudo apt-get clean
sudo journalctl --vacuum-size=20M
echo "=== Disk Usage After ==="
df -h /
