# flow100.ch - Image fuer den Git-basierten App-Deploy (INF-080).
# Unprivilegiert (UID 101, Port 8080), damit der Container wie www/legal/weedli
# read_only und mit cap_drop ALL laufen kann (container_options in apps.yml).
# Statische Seite, kein Build-Schritt.
FROM nginxinc/nginx-unprivileged:1.27-alpine

COPY --chown=101:101 nginx.conf /etc/nginx/conf.d/default.conf
COPY --chown=101:101 public/ /usr/share/nginx/html/

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1:8080/health || exit 1
