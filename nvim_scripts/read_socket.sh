cat > ~/.config/nvim/read_socket.sh << 'EOF'
#!/usr/bin/env bash
SOCKET_FILE="$HOME/.config/nvim/socket_ids"

# If already set, leave it alone
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  return 0 2>/dev/null || exit 0
fi

# Wait briefly if the file doesn't exist yet (e.g. nvim pane still starting)
for i in 1 2 3 4 5; do
  if [ -f "$SOCKET_FILE" ]; then
    last=$(tail -n1 "$SOCKET_FILE")
    if printf '%s' "$last" | grep -qE '^[0-9]+$'; then
      export NVIM_LISTEN_ADDRESS="/tmp/nvimsocket-$last"
    fi
    break
  fi
  sleep 0.1
done
EOF

chmod +x ~/.config/nvim/read_socket.sh
