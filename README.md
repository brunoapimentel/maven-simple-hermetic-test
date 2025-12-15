# Maven parent POMs test scenario

This project contains a Spring Boot Web project and is meant to test the inclusion of parent POMs in the lockfile.

## How the lockfile was generated

```bash
mvn io.github.chains-project:maven-lockfile:5.14.1:generate -DincludeMavenPlugins=true
```

## How to run it locally

```bash
mvn clean package
java -jar target/demo-0.0.1-SNAPSHOT.jar
```

## Testing the hermetic build

Requirements: 
  - Hermeto (a version that has maven support)
  - Maven >= 3
  - Java >= 11

```bash
hermeto --log-level DEBUG fetch-deps maven
podman build \
  -v $(realpath hermeto-output):/tmp/hermeto-output:z \
  -t localhost/maven-test:latest \
  --network none \
  --no-cache \
  -f Dockerfile .
```

*Note that the path to the Maven local files at `/tmp/hermeto-output` is hard-coded into the Dockerfile.*
