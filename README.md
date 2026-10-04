# flow100.ch

Platzhalterseite: zeigt zentriert das Logo mit Wortmarke. Favicon ist das rote Signet.

- `public/` – die ausgelieferte Seite (`index.html`, `404.html`, `assets/`, `favicon.ico`)
- `nginx.conf` – nginx-unprivileged auf Port 8080, `/health` für den Health-Check
- `Dockerfile` – Image `ghcr.io/cheesebyter/www.flow100.ch`
- `.github/workflows/container.yml` – baut pro Push auf `master` das Image mit Tag `sha-<7 Zeichen>`

Logos stammen aus `FLOW100\07_General\Logos_Fonts` (`Logo_mit_Wortmarke.png`, zugeschnitten; `Signet_Rot.png` → Favicons).

## Lokal testen

```bash
docker build -t flow100-ch .
docker run --rm -p 8080:8080 flow100-ch
# http://localhost:8080
```

## Ausrollen

Tag aus der Actions-Zusammenfassung in `FLOW100_Infrastructure/vps-management/ansible/group_vars/all/apps.yml` (Eintrag `flow100`) setzen, dann auf dem Controller `app deploy flow100`.
