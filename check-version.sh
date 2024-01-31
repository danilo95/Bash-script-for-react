# Define expected versions
expected_node_version="14.17.3"
expected_npm_version="6.14.13"

# Get the current version of Node.js and npm
current_node_version=$(node -v 2>&1)
current_npm_version=$(npm -v 2>&1)

echo "Current version of Node.js: $current_node_version"
echo "Current version npm: $current_npm_version"

# Comparar las versiones
if [ "$current_node_version" = "$expected_node_version" ] && [ "$current_npm_version" = "$expected_npm_version" ]; then
  echo "The versions match."
else
  echo "WARNING: The versions do not match. Node.js expected $expected_node_version and npm $expected_npm_version."
fi