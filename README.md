# Maven BOM POMs test scenario

This project contains a POM file that includes a reference to a BOM POM in the dependencyManagement section.

## How the lockfile was generated

```bash
mvn io.github.chains-project:maven-lockfile:5.14.1:generate -DincludeMavenPlugins=true
```

## How to run it locally

The project has no real running functionality, the whole test is limited to dependency resolution.

## Testing the hermetic build

Requirements: 
  - Hermeto (a version that has maven support)
  - Maven >= 3
  - Java >= 17

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
