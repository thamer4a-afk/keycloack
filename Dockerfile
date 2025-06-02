FROM quay.io/keycloak/keycloak:24.0.3

# Admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Database configuration
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-d0urvsndiees73aeqec0-a:5432/pfe_db_3kt9
ENV KC_DB_USERNAME=pfe_db_3kt9_user
ENV KC_DB_PASSWORD=lYXVHTn6iufg8qZhze7xMRQHHUd2iIrJ

# Keycloak proxy & networking
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true
ENV KC_HTTP_HOST=0.0.0.0              # Listen on all interfaces

# Remove KC_HOSTNAME for now (auto-detect)
# ENV KC_HOSTNAME=0.0.0.0  ❌  # REMOVE THIS LINE
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false

# Optional relative path
# ENV KC_HTTP_RELATIVE_PATH=/auth

# Enable health and metrics
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Java options
ENV JAVA_OPTS_APPEND=-Djava.net.preferIPv4Stack=true

# Expose Keycloak HTTP port
EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--http-port=8080"]
