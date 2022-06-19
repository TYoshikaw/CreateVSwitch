####################################################################################################
#
# PowerShell Script of
#
# Create Virtual Switch (Internal) and NAT table on Hyper-V
#
# Created on 2022.5.16
# Updated on 2022.6.19
#
# Note : Replace the following items with the appropriate values
#          VMSwitch
#          IPAddress
#          PrefixLength
#          InterfaceIndex
#          InternalIPInterfaceAddressPrefix
#
# Reference : -
#
####################################################################################################

##################################################
# Create Virtual Switch
##################################################

#### Comfirm ifIndex
#### Use Get-NetAdapter or Get-NetIPInterface
# Get-NetAdapter ##(method 01)
# Get-NetIPInterface ##(method 02)

#### Create new internal virtual switch
New-VMSwitch -Name "IntNAT01" -SwitchType Internal

#### Comfirm ifIndex
#### Use Get-NetAdapter or Get-NetIPInterface
# Get-NetAdapter ##(method 01)
# Get-NetIPInterface ##(method 02)

#### Assign IP Address
New-NetIPAddress -IPAddress 192.168.1.1 -PrefixLength 24 -InterfaceIndex 12

#### Create NAT table
New-NetNat -Name “IntNAT01" -InternalIPInterfaceAddressPrefix 192.168.1.0/24

##################################################
##################################################

##################################################
# Remove Virtual Switch
##################################################

#### Comfirm ifIndex
# Get-NetAdapter

#### Remove IP Address setting
# Remove-NetIPAddress -InterfaceIndex 12 -IPAddress "192.168.1.1"

#### Remove NAT table
# Remove-NetNat -Name “IntNAT01"

#### Remove Virtual Switch using this command or "Virtual Switch Manager" in "Hyper-V Manager"
# Remove-VMSwitch "IntNAT01"

##################################################
##################################################
