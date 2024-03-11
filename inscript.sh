#!/bin/bash

# Update and upgrade Ubuntu
sudo apt update && sudo apt upgrade -y

# Check if BBR is installed
if ! modinfo tcp_bbr &> /dev/null; then
    # Install BBR
    wget -N --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && sudo bash bbr.sh
    # Automatically press Enter after BBR installation
    echo | sudo tee -a /dev/null
fi

# Set timezone to Tehran
sudo timedatectl set-timezone Asia/Tehran


# Add custom command to SSH configuration
sudo sed -i '/# Ciphers and keying/a Ciphers aes256-gcm@openssh.com,aes128-gcm@openssh.com,chacha20-poly1305@openssh.com' /etc/ssh/sshd_config

# Restart SSH service
sudo systemctl restart ssh.service

# Check if vnstat is installed
if ! command -v vnstat &> /dev/null; then
    # Install vnstat
    sudo apt install vnstat -y
fi

echo "Installation completed successfully."
read -p "Press Enter to exit."
