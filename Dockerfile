FROM docker.io/library/maven:3.9

WORKDIR /app

COPY . .

RUN mvn -Dmaven.repo.local=/tmp/hermeto-output/deps/maven -Dmaven.test.skip clean package

CMD ["java", "-jar", "target/maven-bom-0.0.1-SNAPSHOT.jar"]
