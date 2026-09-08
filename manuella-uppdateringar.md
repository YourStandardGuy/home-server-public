# Manuella uppdateringar

Så uppdateras containrarna på den här servern (via WUD = What's Up Docker).

## Systemöversikt

- WUD (http://100.105.29.96:3001) bevakar alla containrar var 6:e timme och meddelar på Telegram.
- **Auto-tjänster** (ofarliga, uppdateras själva vid små/patch-ändringar):
  homepage, netdata, vaultwarden, portainer, uptimekuma.
  Stora hopp (major/minor) → bara notis → du uppdaterar manuellt.
- **Manuella tjänster** (notis-bara — WUD säger bara till, rör dem aldrig):
  allt i arrstacken (radarr, sonarr, prowlarr, bazarr, qbittorrent, gluetun,
  autobrr, thelounge, jellyfin, seerr, qbit_manage …), immich, pihole, wud,
  samt proxysarna (portainer-proxy, dnscrypt-proxy, socket-proxy).
  Skäl: databas/migrationer (arrs, immich), DNS-kritiskt (pihole, dnscrypt),
  säkerhetskritiskt (proxysarna), eller "who watches the watchmen" (wud).

## Uppdatera manuellt — ett klick

1. Öppna WUD: http://100.105.29.96:3001
2. Klicka på containern med uppdateringen → knappen **dockercompose manual → Run**
3. WUD pinnar nya versionen i compose-filen, startar om containern, klart.
4. Committa ändringen: `cd ~/docker && git add -A && git commit`

## Särskilda fall

- **Immich**: compose-filen använder `${IMMICH_VERSION}` — WUD-knappen kan inte
  skriva om den. Uppdatera i stället `~/docker/immich/.env`
  (`IMMICH_VERSION=x.y.z`) och kör `docker compose up -d` i `~/docker/immich`
  (server + ML + postgres + redis uppdateras som en enhet).
- **Nextcloud AIO**: sköter sina egna uppdateringar (wud.watch=false) — använd
  AIO:s eget UI.

## Rollback

- Git-baseline i `~/docker` är skyddsnätet: `git log`, `git checkout <fil>`.
- WUD:s auto-trigger sparar dessutom `.back`-kopia av compose-filen före ändring.
