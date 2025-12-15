FROM docker.io/library/maven:3.9-eclipse-temurin-21

WORKDIR /app

COPY . .

RUN mvn -o -Dmaven.repo.local=/app/hermeto-output/deps/maven package -Dmaven.test.skip

CMD ["java", "-jar", "target/hello-world-1.0-SNAPSHOT.jar"]
