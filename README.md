# Simple Maven hermetic build test

This project contains a simple Maven project that includes a single direct dependency. This project is meant to test direct and transitive dependency resolution in the lockfile.

## How the lockfile was generated

```bash
./mvnw io.github.chains-project:maven-lockfile:5.14.1:generate -DincludeMavenPlugins=true
```

## How to build it locally

```bash
mvn clean package
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
