# Setup PlantUML

[![CI](https://github.com/jassielof/setup-plantuml/actions/workflows/ci.yaml/badge.svg)](https://github.com/jassielof/setup-plantuml/actions/workflows/ci.yaml)

Install [PlantUML](https://plantuml.com) CLI on GitHub Actions runners with Java 25 LTS and Graphviz.

## Features

- **Latest or specific version**: Install the latest PlantUML release or pin to a specific version
- **Java 25 LTS**: Uses Eclipse Temurin JRE by default, with support for other distributions
- **Cross-platform**: Works on Linux, macOS, and Windows runners
- **Graphviz included**: Automatically sets up Graphviz for diagram generation

## Usage

```yaml
- uses: jassielof/setup-plantuml@v1
- run: plantuml diagrams/*.puml
```

## Inputs

| Input | Description | Default |
|-------|-------------|---------|
| `version` | PlantUML version (e.g., `1.2026.1`) or `latest` | `latest` |
| `java-version` | Java version or `latest-lts` (fetched from Adoptium API) | `latest-lts` |
| `java-distribution` | Java distribution (see [setup-java](https://github.com/actions/setup-java)) | `temurin` |

## Outputs

| Output | Description |
|--------|-------------|
| `version` | The installed PlantUML version |
| `java-version` | The installed Java version |
| `path` | Installation directory |

## Examples

### Basic usage

```yaml
name: Generate Diagrams

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6
      - uses: jassielof/setup-plantuml@v1
      - run: plantuml -tsvg diagrams/*.puml
      - uses: actions/upload-artifact@v4
        with:
          name: diagrams
          path: diagrams/*.svg
```

### Pin specific version

```yaml
- uses: jassielof/setup-plantuml@v1
  with:
    version: "1.2026.1"
    java-version: "25"
```

### Use Microsoft OpenJDK

```yaml
- uses: jassielof/setup-plantuml@v1
  with:
    java-distribution: "microsoft"
```

## Supported platforms

| OS | Runner |
|----|--------|
| Linux | `ubuntu-latest` |
| macOS | `macos-latest` |
| Windows | `windows-latest` |

## License

[MIT](./LICENSE.txt)
