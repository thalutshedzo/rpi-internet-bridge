#!/bin/bash

# Update and install required packages
sudo apt update
sudo apt install -y dhcpcd5 dnsmasq iptables-persistent

# Configure static IP for eth0
echo -e "\ninterface eth0\nstatic ip_address=192.168.2.1/24\n" | sudo tee -a /etc/dhcpcd.conf

# Configure dnsmasq
sudo tee /etc/dnsmasq.conf <<EOF
interface=eth0
dhcp-range=192.168.2.10,192.168.2.20,255.255.255.0,24h
EOF

# Enable IP forwarding
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
sudo sysctl -p

# Configure NAT with iptables
sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
sudo iptables -A FORWARD -i eth0 -o wlan0 -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo sh -c "iptables-save > /etc/iptables/rules.v4"

# Reboot to apply changes
sudo reboot
