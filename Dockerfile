FROM nginx:alpine

# Use custom nginx config (SPA-friendly) and copy site files
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY . /usr/share/nginx/html

# Lightweight healthcheck: ensure index.html exists
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD ["/bin/sh","-c","[ -f /usr/share/nginx/html/index.html ] || exit 1"]