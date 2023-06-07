#!/bin/bash
#-----------------------
#--Required Packages-
#-ufw
#-fail2ban

# Check if packages are installed
if yay -Qs ufw &> /dev/null && yay -Qs fail2ban &> /dev/null; then
    echo "Required packages (ufw and fail2ban) are installed."
    # Continue with the rest of your script here

    # --- Setup UFW rules
    sudo ufw limit 22/tcp  
    sudo ufw allow 80/tcp  
    sudo ufw allow 443/tcp  
    sudo ufw default deny incoming  
    sudo ufw default allow outgoing
    sudo ufw enable

    # --- Harden /etc/sysctl.conf
    sudo sysctl kernel.modules_disabled=1
    sudo sysctl -a
    sudo sysctl -A
    sudo sysctl mib
    sudo sysctl net.ipv4.conf.all.rp_filter
    sudo sysctl -a --pattern 'net.ipv4.conf.(eth|wlan)0.arp'

    # --- PREVENT IP SPOOFS
    cat <<EOF > /etc/host.conf
order bind,hosts
multi on
EOF

    # --- Enable fail2ban
    sudo cp jail.local /etc/fail2ban/
    sudo systemctl enable fail2ban
    sudo systemctl start fail2ban

    echo "listening ports"
    sudo ss -tunlp

else
    echo "Required packages (ufw and/or fail2ban) are not installed."
    exit 1
fi

