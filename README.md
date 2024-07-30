# rpi-internet-bridge
A script to configure a Raspberry Pi to route internet access from Wi-Fi to Ethernet.
# Raspberry Pi Internet Bridge

This repository contains a script to configure a Raspberry Pi to route internet access from a Wi-Fi connection to a device connected via Ethernet.

## Usage

1. **Clone the repository:**

    ```sh
    git clone https://github.com/your-username/rpi-internet-bridge.git
    ```

2. **Navigate to the directory:**

    ```sh
    cd rpi-internet-bridge
    ```

3. **Make the script executable:**

    ```sh
    chmod +x rpi_internet_bridge.sh
    ```

4. **Run the script with sudo:**

    ```sh
    sudo ./rpi_internet_bridge.sh
    ```

## Script Details

- **Updates and installs required packages** (`dhcpcd5`, `dnsmasq`, `iptables-persistent`)
- **Configures static IP for `eth0`**
- **Configures `dnsmasq` for DHCP**
- **Enables IP forwarding**
- **Sets up NAT with `iptables`**
- **Reboots the Raspberry Pi**

## License

This project is licensed under the MIT License.

