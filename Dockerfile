# Simple Dockerfile to serve the static site using nginx
FROM nginx:stable-alpine

# Remove default nginx html
RUN rm -rf /usr/share/nginx/html/*

# Copy site files into nginx html directory
COPY . /usr/share/nginx/html/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD wget -qO- http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
