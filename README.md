# Maven CLI JDKs Action

<a href="https://github.com/search?q=GuillaumeFalourd+maven-cli-jdks-action+path%3A.github%2Fworkflows+language%3AYAML&type=code" target="_blank" title="Public workflows that use this action."><img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fapi-git-master.endbug.vercel.app%2Fapi%2Fgithub-actions%2Fused-by%3Faction%3DGuillaumeFalourd%2Fmaven-cli-jdks-action%26badge%3Dtrue" alt="Public workflows that use this action."></a>

![maven-cli-jdks-action](https://user-images.githubusercontent.com/22433243/116424068-999f4c00-a817-11eb-84ab-3733a2686e0a.png)

Github Action wrapping Maven CLI to run any Maven commands using JDK 8, 11, 13, 14, 15, 16 or 17 based on [Maven DockerHub](https://hub.docker.com/_/maven).

Those commands can be executed on the current repository directory, or in a specific one using a `$DIRECTORY_PATH` environment variable.

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
        DIRECTORY_PATH: java # Not mandatory (run on the repo root directory if not informed)
      with:
        commands: 'clean package test'
```

## How does it work?

This workflow use a `Dockerfile` with `Maven` and a specific `JDK` installed to execute a Shell script file `entrypoint.sh` to perfom the following commands:

```bash
if [[ -z $DIRECTORY_PATH ]]; 
then
    echo "DIRECTORY_PATH env isn't set. Running in current directory"
else
    echo "Moving to specified directory path"
    cd $DIRECTORY_PATH
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

### For OpenJDK 17

```bash
uses: GuillaumeFalourd/maven-cli-jdks-action@jdk17
```

## Licensed

This repository uses the [Apache License 2.0](https://github.com/GuillaumeFalourd/maven-cli-jdks-action/blob/main/LICENSE)
