#!/bin/bash
apt-get update -y
apt-get install -y apt-transport-https ca-certificates curl openvswitch-switch

# Create a user and set a password
useradd -m -s /bin/bash naftaly
echo 'naftaly:1899' | chpasswd

# Ensure the user can log in via SSH
mkdir -p /home/naftaly/.ssh
chmod 700 /home/naftaly/.ssh
chown naftaly:naftaly /home/naftaly/.ssh

# Add the user to the sudo group for administrative access
usermod -aG sudo naftaly

# Enable SSH if not already enabled
systemctl enable ssh
systemctl start ssh

# Add Kubernetes repository
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/kubernetes-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list

# Install kubeadm, kubelet, kubectl
apt-get update -y
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

# Enable and start OVS service
systemctl enable openvswitch-switch
systemctl start openvswitch-switch

# Create OVS bridge and configure network
ovs-vsctl add-br br0

# Configure kubeadm dependencies
sudo swapoff -a
sudo echo '1' > /proc/sys/net/ipv4/ip_forward

# Output bridge status for debugging
ovs-vsctl show
