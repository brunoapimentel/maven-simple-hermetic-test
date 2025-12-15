FROM docker.io/library/maven:3.9-eclipse-temurin-21

WORKDIR /app

COPY . .

RUN mvn clean package

CMD ["java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]
