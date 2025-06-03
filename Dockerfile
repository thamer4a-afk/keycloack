FROM quay.io/keycloak/keycloak:24.0.3

# Set admin credentials for Keycloak
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Configure database connection
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-d0urvsndiees73aeqec0-a:5432/pfe_db_3kt9
ENV KC_DB_USERNAME=pfe_db_3kt9_user
ENV KC_DB_PASSWORD=lYXVHTn6iufg8qZhze7xMRQHHUd2iIrJ

# Configure Keycloak networking and proxy settings
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false

# Enable health checks and metrics
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Java options (IPv4 preference)
ENV JAVA_OPTS_APPEND="-Djava.net.preferIPv4Stack=true -Djboss.as.management.blocking.timeout=3600"

# Set hostname to your actual domain or remove if using IP only
# ENV KC_HOSTNAME=yourdomain.com

# Expose ports
EXPOSE 8080

# Start Keycloak in production mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--http-port=8080"]
