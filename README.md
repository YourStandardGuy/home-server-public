# home-server

Public snapshot of my self-hosted home server Docker stack.

> Reference snapshot — this repo is intentionally NOT kept up to date.
> Configuration values live in local `.env` files (not included), and
> volume mounts are specific to my server hardware.
> CONFIG IS LEFT OUT FOR PRIVACY REASONS and
> a few other cool applications had to be left out...

## Services

| Directory | What it is |
|---|---|
| `arrstack/` | Media stack — **Jellyfin** (media server), **Radarr** (movies), **Sonarr** (TV), **Prowlarr** (indexer manager), **Bazarr** (subtitles), **Seerr** (media requests), **The Lounge** (IRC) |
| `pihole/` | DNS ad-blocking (Pi-hole + dnscrypt-proxy) |
| `homepage/` | Startpage dashboard for all services |
| `vaultwarden/` | Self-hosted password manager |
| `netdata/` | System monitoring |
| `uptimekuma/` | Uptime monitoring |
| `wud/` | What's Up Docker — container update watcher |
| `nextcloud/` | Files & cloud storage |
| `immich/` | Photo backup |
| `portainer/` | Container management UI (behind `socket-proxy/`) |
| `socket-proxy/` | Secured Docker API proxy |

## Requirements

- Docker + Docker Compose
- A local `.env` file per stack (variables such as `PUID`, `PGID`, `TZ`, `TS_AUTHKEY_*` are referenced but never committed)
- Tailscale for remote access (services bind to tailnet IPs)
- `arrstack/` uses an NVIDIA GPU runtime for Jellyfin hardware transcoding

## Notes

- `manuella-uppdateringar.md` — notes on manual update procedures (Swedish)
- Every stack is pinned to stable image tags (no `:latest`)
- WUD labels (`wud.*`) are used to track container updates
