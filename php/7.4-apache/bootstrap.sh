#!/bin/sh

for file in /init.d/*; do
  [ -f "$file" ] && [ -x "$file" ] && "$file"
done

apache2-foreground
