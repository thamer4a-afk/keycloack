FROM quay.io/keycloak/keycloak:24.0.3

# Set admin user and password as environment variables
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# PostgreSQL database configuration
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-d0urvsndiees73aeqec0-a:5432/pfe_db_3kt9
ENV KC_DB_USERNAME=pfe_db_3kt9_user
ENV KC_DB_PASSWORD=lYXVHTn6iufg8qZhze7xMRQHHUd2iIrJ

# Enable health and metrics endpoints
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_HTTP_ENABLED=true

# Optional JVM settings
ENV JAVA_OPTS_APPEND=-Djava.net.preferIPv4Stack=true

# Expose Keycloak port
EXPOSE 8080

# Start Keycloak in production mode, bind to port 8080
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--http-port=8080"]
