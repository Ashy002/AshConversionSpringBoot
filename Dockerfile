FROM eclipse-temurin:21-jdk-jammy as build
COPY . .
# On s'assure que le script mvnw est exécutable
RUN chmod +x mvnw 
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
# Correction ici : target/... au lieu de /target/...
COPY --from=build target/ash-conversion-0.0.1-SNAPSHOT.war app.war

EXPOSE 10000

# Le flag est crucial pour que Tomcat serve les JSP depuis le WAR
ENTRYPOINT ["java", "-Xmx256m", "-Xms256m", "-jar", "app.war", "--server.servlet.register-default-servlet=true"]