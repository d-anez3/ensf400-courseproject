# Use a Gradle image with JDK 11 as the base
FROM gradle:7.6-jdk11

# Set the working directory
WORKDIR /home/app

# Copy all project files into the container
COPY . .

# Expose the application port
EXPOSE 8080

# Run the application using Gradle
ENTRYPOINT ["./gradlew", "apprun"]