#!/bin/bash

# Installer script for TypeWriterOS with a lightweight DE (LXQt)

# Check for root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root. Exiting."
    exit 1
fi

# Update system
echo "Updating system packages..."
apt update && apt upgrade -y

# Install necessary packages
echo "Installing lightweight desktop environment (LXQt) and utilities..."
apt install -y lxqt sddm xbindkeys featherpad neovim rofi udisks2 git curl

# Set up auto-login
echo "Configuring auto-login for SDDM..."
cat <<EOF >/etc/sddm.conf
[Autologin]
User=writer
Session=lxqt
EOF

# Create writer user
echo "Creating 'writer' user account..."
useradd -m -s /bin/bash writer
echo "writer:password" | chpasswd

# Set up file slots
echo "Setting up file slot system (F1–F12)..."
mkdir -p /home/writer/Documents/TypeWriterOS
for i in {1..12}; do
    touch /home/writer/Documents/TypeWriterOS/file${i}.txt
done

# Create xbindkeys configuration
echo "Configuring keyboard shortcuts for file slots..."
cat <<EOF >/home/writer/.xbindkeysrc
"featherpad /home/writer/Documents/TypeWriterOS/file1.txt"
    F1
"featherpad /home/writer/Documents/TypeWriterOS/file2.txt"
    F2
"featherpad /home/writer/Documents/TypeWriterOS/file3.txt"
    F3
"featherpad /home/writer/Documents/TypeWriterOS/file4.txt"
    F4
"featherpad /home/writer/Documents/TypeWriterOS/file5.txt"
    F5
"featherpad /home/writer/Documents/TypeWriterOS/file6.txt"
    F6
"featherpad /home/writer/Documents/TypeWriterOS/file7.txt"
    F7
"featherpad /home/writer/Documents/TypeWriterOS/file8.txt"
    F8
"featherpad /home/writer/Documents/TypeWriterOS/file9.txt"
    F9
"featherpad /home/writer/Documents/TypeWriterOS/file10.txt"
    F10
"featherpad /home/writer/Documents/TypeWriterOS/file11.txt"
    F11
EOF

# Set ownership and permissions
echo "Setting ownership and permissions..."
chown -R writer:writer /home/writer
chmod -R 700 /home/writer/Documents/TypeWriterOS

# Configure autostart for FeatherPad
echo "Setting up FeatherPad to open on startup..."
mkdir -p /home/writer/.config/autostart
cat <<EOF >/home/writer/.config/autostart/featherpad.desktop
[Desktop Entry]
Type=Application
Exec=featherpad
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=FeatherPad
EOF

# Export script for F12
echo "Creating export script for USB drives..."
cat <<'EOF' >/usr/local/bin/export_to_usb.sh
#!/bin/bash
# Script to export files to USB drive
MOUNTPOINT=$(lsblk -o MOUNTPOINT -r | grep '/media/' | head -n 1)

if [[ -n $MOUNTPOINT ]]; then
    cp /home/writer/Documents/TypeWriterOS/*.txt "$MOUNTPOINT"
    notify-send "Files exported successfully to $MOUNTPOINT"
else
    notify-send "No USB drive detected. Please insert a USB drive."
fi
EOF
chmod +x /usr/local/bin/export_to_usb.sh

# Configure shortcut for file export
echo "Adding F12 shortcut for file export..."
echo '"export_to_usb.sh"' >>/home/writer/.xbindkeysrc
echo "    F12" >>/home/writer/.xbindkeysrc

# Enable and start necessary services
echo "Enabling and starting necessary services..."
systemctl enable sddm
systemctl start sddm

echo "Installation complete! Reboot the system to enter TypeWriterOS."
