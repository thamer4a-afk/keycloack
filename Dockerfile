FROM quay.io/keycloak/keycloak:24.0.3

# Set admin user and password as environment variables
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Expose default Keycloak port
EXPOSE 8080

# Start Keycloak in development mode binding to port 8080
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-port=8080"]
