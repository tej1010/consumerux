#!/usr/bin/env bash
set -euo pipefail

# Install Flutter (clone stable branch)
FLUTTER_DIR="$HOME/.flutter"
if [ ! -d "$FLUTTER_DIR" ]; then
  echo "Installing Flutter..."
  git clone --depth 1 -b stable https://github.com/flutter/flutter.git "$FLUTTER_DIR"
fi

export PATH="$FLUTTER_DIR/bin:$FLUTTER_DIR/bin/cache/dart-sdk/bin:$PATH"

# Warm up flutter tooling (downloads engine artifacts / Dart SDK as needed)
echo "Checking Flutter version..."
flutter --version

# Ensure web artifacts are available
echo "Precaching web artifacts..."
flutter precache --web

# Get packages and build
echo "Getting Flutter packages..."
flutter pub get

echo "Building web app..."
flutter build web --release

echo "Build completed successfully!"
