if grep --quiet "^pnpm " .tool-versions; then
  echo "::set-output name=detected::true"
fi