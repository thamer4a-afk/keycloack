FROM quay.io/keycloak/keycloak:24.0.3

# Set Keycloak to start in development mode (optional for dev)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Run Keycloak with dev mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
