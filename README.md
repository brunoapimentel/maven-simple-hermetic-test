# Simple Maven hermetic build test

This project contains a simple Maven project that includes a single direct dependency. It also makes use of the Maven Shade plugin to create a runnable jar.

This project is meant to test direct and transitive dependency resolution in the lockfile, as well as plugin dependencies. Because of how some of the default Maven plugins are declared, it also tests the resolution of BOM POMs.

## How the lockfile was generated

```bash
./mvnw io.github.chains-project:maven-lockfile:5.14.1:generate -DincludeMavenPlugins=true
```

## How to run it locally

```bash
mvn clean package
java -jar target/maven-simple-0.0.1-SNAPSHOT.jar
```

## Testing the hermetic build

Requirements: 
  - Hermeto (a version that has maven support)
  - Maven >= 3
  - Java >= 11

```bash
hermeto --log-level DEBUG fetch-deps maven
podman build -v $(realpath hermeto-output):/tmp/hermeto-output:z \
  -t localhost/maven-test:latest \
  --network none \
  --no-cache \
  -f Dockerfile .
```

*Note that the path to the Maven local files at `/tmp/hermeto-output` is hard-coded into the Dockerfile.*
