set -e

VERSION="${VERSION:-latest}"
INSTALL_DIR="${INSTALL_DIR:-$GITHUB_WORKSPACE/.plantuml}"

mkdir -p "$INSTALL_DIR"

if [ "$VERSION" = "latest" ]; then
  URL="https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar"
else
  URL="https://github.com/plantuml/plantuml/releases/download/v${VERSION}/plantuml-${VERSION}.jar"
fi

echo "Downloading PlantUML from: $URL"
curl -L --fail -o "$INSTALL_DIR/plantuml.jar" "$URL"
echo "Downloaded to: $INSTALL_DIR/plantuml.jar"
