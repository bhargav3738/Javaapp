# Use a lightweight base image
FROM openjdk:8-jre-alpine

# Set working directory
WORKDIR /usr/app

# Copy JAR file into the container
COPY ./build/libs/my-app-1.0-SNAPSHOT.jar app.jar

# Expose the application port
EXPOSE 8080

# Run as a non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Use ENTRYPOINT to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
