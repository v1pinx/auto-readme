#!/bin/bash

INTERFACE=wlp0s20f3

# Generate a random MAC address (e.g., 02:xx:xx:xx:xx:xx where 02 is the locally administered address)
NEW_MAC=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/:$//')

# Bring the interface down
echo "Bringing down interface $INTERFACE..."
sudo ip link set dev $INTERFACE down

# Change the MAC address
echo "Changing MAC address of $INTERFACE to $NEW_MAC..."
sudo ip link set dev $INTERFACE address $NEW_MAC

# Bring the interface up
echo "Bringing up interface $INTERFACE..."
sudo ip link set dev $INTERFACE up

# Verify the change
echo "New MAC address of $INTERFACE:"
ip link show $INTERFACE | grep ether

