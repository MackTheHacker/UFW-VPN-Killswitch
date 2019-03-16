#! /bin/bash

echo "Setup killswitch rules? [y/N]" 
read userInit

if [ $userInit = "y" ]; then
	echo "Setting up firewall rules..." 
	ufw default deny outgoing
	ufw default deny incoming
	ufw allow out on tun0 from any to any 
	
	if [ -z "$1" ]; then
		(>&2 echo "No IP address provided in commandline, skipping first entry")
	else
		ufw allow out to $1
	fi

	if [ -z "$2" ]; then
		(>&2 echo "No IP address provided in commandline, skipping second entry")
	else
		ufw allow out to $2
	fi
	
	if [ -z "$3" ]; then
		(>&2 echo "No IP address provided in commandline, skipping third entry")
	else
		ufw allow out to $3
	fi
	
	if [ -z "$4" ]; then
		(>&2 echo "No IP address provided in commandline, skipping fourth entry")
	else
		ufw allow out to $4
	fi
	echo "you may rerun the script and provide up to 4 VPN IP addresses if you are not satisfied with this configuration." 
fi


echo "[y/N] Start VPN connection (MUST SET THIS UP BEFOREHAND!)" 
read userChoiceConnect

if [ $userChoiceConnect = "y" ]; then
	echo "connecting to VPN..."
	nmcli --ask con up id YOUROVPNCONFIGFILEHERE
fi

echo "[y/N] to ENABLE ufw killswitch?" 
read userChoiceON

if [ $userChoiceON = "y" ]; then 
	echo "ufw killswitch enabled"
	ufw enable 
fi


echo "[y/N] to DISABLE killswitch?" 
read userChoiceOFF

if [ $userChoiceOFF = "y" ]; then
	echo "ufw killswitch disabled"
	ufw disable
fi

echo $(ufw status)
echo "Program terminating...." 


