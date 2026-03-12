# Étape 1 : Build
FROM eclipse-temurin:17-jdk-jammy AS build
WORKDIR /app
COPY . .
RUN chmod +x mvnw
# On s'assure que le build génère bien un WAR
RUN ./mvnw clean package -DskipTests

# Étape 2 : Run
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

# Utilisation d'un joker (*) pour ne pas dépendre du numéro de version
COPY --from=build /app/target/*.war app.war

EXPOSE 8080

# Optimisation mémoire (256MB) et support JSP
ENTRYPOINT ["java", "-Xmx256m", "-Xms256m", "-jar", "app.war"]
