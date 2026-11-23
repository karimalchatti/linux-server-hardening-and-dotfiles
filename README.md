# Linux Server Hardening & Dotfiles

Production-grade security baseline, firewall automation, and disk hygiene utilities built and tested on a bare-metal headless Debian/Ubuntu homelab node (`3.7 GiB RAM`, `11 GB` eMMC storage).

## Repository Layout
* `ssh/99-hardening.conf` — Enforces `ed25519` key-only SSH & disables root/password logins.
* `firewall/setup-ufw.sh` — Idempotent `UFW` default-deny ingress baseline.
* `scripts/disk-hygiene.sh` — Automated `apt` cache & `systemd` journal vacuum (`20M` cap).
* `dotfiles/.bash_aliases` — Portable CLI shortcuts for Linux & Kubernetes administration.

## Key Engineering Highlights
* **Zero-Password SSH Security:** Locks `sshd` to `ed25519` public-key authentication (`AuthenticationMethods publickey`) with strict retry and idle timeout controls.
* **Default-Deny Host Firewall:** Automates `ufw` to block all unsolicited inbound traffic while permitting hardened `OpenSSH`.
* **Resource-Constrained Optimization:** Designed specifically to keep a `3.7 GiB RAM / 11 GB` disk bare-metal node healthy under continuous container and `k3s` workloads.

## Quick Usage
* Copy SSH hardening config: `sudo cp ssh/99-hardening.conf /etc/ssh/sshd_config.d/ && sudo systemctl reload ssh`
* Enable default-deny firewall: `./firewall/setup-ufw.sh`
* Reclaim disk space: `./scripts/disk-hygiene.sh`
