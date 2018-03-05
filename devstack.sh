#!/bin/bash

echo "CREATE STACK USER..."
useradd -s /bin/bash -d /opt/stack -m stack
echo "stack ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/stack
echo "CLONING DEVSTACK REPO..."
su - stack -c 'git clone https://git.openstack.org/openstack-dev/devstack'
su - stack -c 'cd devstack && git checkout stable/newton'
echo "GENERATE LOCAL.CONF..."
su - stack -c 'cat <<EOL > ~/devstack/local.conf
[[local|localrc]]
ADMIN_PASSWORD=secret
DATABASE_PASSWORD=secret
RABBIT_PASSWORD=secret
SERVICE_PASSWORD=secret
#Private Tenant Network
FIXED_RANGE=172.21.0.0/24
FIXED_NETWORK_SIZE=256
PUBLIC_INTERFACE=enp0s8
enable_plugin heat https://git.openstack.org/openstack/heat newton-eol
FLOATING_RANGE=172.16.100.224/27
HOST_IP=172.16.100.10
SERVICE_HOST=172.16.100.10
MYSQL_HOST=172.16.100.10
RABBIT_HOST=172.16.100.10

OVS_PHYSICAL_BRIDGE=br-ex
PUBLIC_BRIDGE=br-ex
OVS_BRIDGE_MAPPINGS=public:br-ex

#HORIZON_BRANCH=stable/newton  
#KEYSTONE_BRANCH=stable/newton  
#KEYSTONE_BRANCH=newton-eol  
#NOVA_BRANCH=stable/newton  
#NEUTRON_BRANCH=stable/newton  
#GLANCE_BRANCH=stable/newton
#SWIFT_BRANCH=stable/newton

KEYSTONE_BRANCH=newton-eol  
HORIZON_BRANCH=newton-eol  
NOVA_BRANCH=newton-eol  
NEUTRON_BRANCH=newton-eol  
GLANCE_BRANCH=newton-eol
SWIFT_BRANCH=newton-eol
CINDER_BRANCH=newton-eol

enable_service s-proxy s-object s-container s-account
SWIFT_HASH=JRBj7ukxMG4tckek
EOL'

echo "BUILDING DEVSTACK... THIS TAKES AWHILE..."
su - stack -c './devstack/stack.sh'
