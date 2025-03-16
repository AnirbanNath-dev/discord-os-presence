#!/bin/bash

SERVICE_FOLDER="$HOME/.config/systemd/user/"

# Ensure systemd user directory exists
mkdir -p ~/.config/systemd/user

# Create systemd service file
echo "Creating systemd service..."

cp dsc-rpc.service $SERVICE_FOLDER

# Reload systemd daemon
echo "Reloading systemd daemon..."
systemctl --user daemon-reload

# Enable and start the service
echo "Enabling and starting the Discord RPC service..."
systemctl --user start dsc-rpc

echo "✅ Setup complete!"
echo "📌 Useful commands:"
echo "  - Check logs: journalctl --user -u dsc-rpc -f"
echo "  - Restart service: systemctl --user restart dsc-rpc"
echo "  - Stop service: systemctl --user stop dsc-rpc"
.
