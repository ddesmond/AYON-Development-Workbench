echo "Tearing all down..."
export LINK_OR_DIR="$2"
if [ -d "$LINK_OR_DIR" ]; then
  if [ -L "$LINK_OR_DIR" ]; then
    # It is a symlink!
    # Symbolic link specific commands go here.
    rm -rf "$LINK_OR_DIR"
  else
    # It's a directory!
    # Directory command goes here.
    rm -rf "$LINK_OR_DIR"
  fi
fi
echo "Tear down complete."