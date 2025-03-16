#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Define the path to the service file
SERVICE_FILE="$SCRIPT_DIR/dsc-rpc.service"

# Check if the service file already exists
if [ -f "$SERVICE_FILE" ]; then
    echo "⚠️ Service file already exists: $SERVICE_FILE"
    exit 1
fi

# Create the service file with dynamic SCRIPT_DIR
cat <<EOF > "$SERVICE_FILE"
[Unit]
Description=Discord RPC Client
After=network.target

[Service]
ExecStart=$SCRIPT_DIR/.venv/bin/python3 $SCRIPT_DIR/src/client.py
Restart=always
WorkingDirectory=$SCRIPT_DIR
Environment="PATH=$SCRIPT_DIR/.venv/bin"
StandardOutput=append:$SCRIPT_DIR/logs/rpc.log
StandardError=append:$SCRIPT_DIR/logs/rpc_error.log

[Install]
WantedBy=default.target
EOF

echo "✅ Service file created at: $SERVICE_FILE"
