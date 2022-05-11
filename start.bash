#!/bin/bash

GHOST="/ghost"
OVERRIDE="/ghost-override"

CONFIG="config.$NODE_ENV.json"
VERSION="versions/$GHOST_VERSION"
DATA="content/data"
SETTINGS="content/settings"
IMAGES="content/images"
THEMES="content/themes"

cd "$GHOST"

echo "Symlink data directory."
mkdir -p "$OVERRIDE/$DATA"
rm -fr "$VERSION/$DATA"
ln -s "$OVERRIDE/$DATA" "$VERSION/content"

echo "Symlink settings directory."
mkdir -p "$OVERRIDE/$SETTINGS"
rm -fr "$VERSION/$SETTINGS"
ln -s "$OVERRIDE/$SETTINGS" "$VERSION/$SETTINGS"

echo "Symlink images directory."
mkdir -p "$OVERRIDE/$IMAGES"
rm -fr "$VERSION/$IMAGES"
ln -s "$OVERRIDE/$IMAGES" "$VERSION/$IMAGES"

echo "Symlink config file."
if [[ -f "$OVERRIDE/$CONFIG" ]]; then
  rm -f "$CONFIG"
  ln -s "$OVERRIDE/$CONFIG" "$CONFIG"
fi

echo "Symlink themes."
if [[ -d "$OVERRIDE/$THEMES" ]]; then
  for theme in $(find "$OVERRIDE/$THEMES" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)
  do
    rm -fr "$VERSION/$THEMES/$theme"
    ln -s "$OVERRIDE/$THEMES/$theme" "$VERSION/$THEMES/$theme"
  done
fi

echo "Starting Ghost..."
chown -R ghost-user:ghost-user /ghost /ghost-override
su ghost-user << EOF
cd "$GHOST"
NODE_ENV=${NODE_ENV:-production} node "$VERSION"/index.js
EOF
