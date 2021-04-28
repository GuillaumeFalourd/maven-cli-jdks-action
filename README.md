# maven-cli-jdks-action

Maven CLI Action with JDK 8, 11, 13, 14 and 15

## Workflow Demo

```bash
name: CI

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    # Checkout your repository under $GITHUB_WORKSPACE, so your job can access your directories and files
    - uses: actions/checkout@v2

    # Runs a set of commands using the runners shell
    - name: Run maven commands
      uses: GuillaumeFalourd/maven-cli-jdks-action@main # Default is JDK 11
      env:
        DIRECTORY: java # Not mandatory (run on the repo root directory if not informed)
      with:
        lifecycle: 'clean package test'
```

## How does it work?

This workflow use a `Dockerfile` with `Maven` and a specific `JDK` installed to execute a Shell script file `entrypoint.sh` to perfom the following commands:

```bash
if [[ -z $DIRECTORY ]]; 
then
    echo "DIRECTORY env isn't set. Running in current directory"
else
    echo "Moving to specified directory path"
    cd $DIRECTORY
fi

echo "Executing command: mvn $1"

sh -c "mvn $1"
```

## How to use a different JDK ?

### For OpenJDK 8

```bash
uses: GuillaumeFalourd/maven-cli-action@jdk8
```

### For OpenJDK 11 (`main`)

```bash
uses: GuillaumeFalourd/maven-cli-jdks-action@main
```

### For OpenJDK 12

```bash
uses: GuillaumeFalourd/maven-cli-jdks-action@jdk12
```

### For OpenJDK 13

```bash
uses: GuillaumeFalourd/maven-cli-jdks-action@jdk13
```

### For OpenJDK 14

```bash
uses: GuillaumeFalourd/maven-cli-jdks-action@jdk14
```

### For OpenJDK 15

```bash
uses: GuillaumeFalourd/maven-cli-jdks-action@jdk15
```

### For OpenJDK 16

```bash
uses: GuillaumeFalourd/maven-cli-jdks-action@jdk16
```
