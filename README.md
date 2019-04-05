A simple interactive script to connect your VPN and setup a killswitch.

NOTES:

A). This script will only work if run as root. It will fail otherwise. Inspect the code before you do so.

B). To setup the firewall rules initially, you MUST provide up to FOUR VPN IP addresses to connect to in the command line

C). You must import your VPN connection beforehand and configure it before you run this script. (This is designed for OpenVPN)

C2). Once you have configured your VPN connection, edit line 50 with the name of your VPN's connection (check with: nmcli con) 

D). This script utilizes UFW. If you do not have it installed, it will not work. 

E). Make sure your DNS server is configured properly so you don't have DNS leaks.
