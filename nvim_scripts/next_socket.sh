mkdir -p ~/.config/nvim

cat > ~/.config/nvim/next_socket.sh << 'EOF'
#!/usr/bin/env bash
SOCKET_FILE="$HOME/.config/nvim/socket_ids"

# If already set in this shell, don't change it
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  return 0 2>/dev/null || exit 0
fi

mkdir -p "$(dirname "$SOCKET_FILE")"

if [ -f "$SOCKET_FILE" ]; then
  last=$(tail -n1 "$SOCKET_FILE")
  # fallback if file is weird/empty
  if ! printf '%s' "$last" | grep -qE '^[0-9]+$'; then
    last=0
  fi
  n=$((last + 1))
else
  n=1
fi

echo "$n" >> "$SOCKET_FILE"
export NVIM_LISTEN_ADDRESS="/tmp/nvimsocket-$n"
EOF

chmod +x ~/.config/nvim/next_socket.sh
