#!/bin/bash

# Update and upgrade Ubuntu
sudo apt update && sudo apt upgrade -y

# Check if BBR is installed
if ! modinfo tcp_bbr &> /dev/null; then
    # Install BBR
    wget -N --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && bash bbr.sh
fi

# Set timezone to Tehran
sudo timedatectl set-timezone Asia/Tehran

# Add additional ports to SSH configuration
sudo sed -i '/Port 22/a Port 400\nPort 600\nPort 800' /etc/ssh/sshd_config

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
