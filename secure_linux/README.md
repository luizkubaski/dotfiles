# Secure Linux
This was taken from [ChrisTitusTech](https://christitus.com/secure-linux/).

### 1. Required Packages: 
The packages that are required for the script to work properly are `ufw` (Uncomplicated Firewall) and `fail2ban` (intrusion prevention software).

### 2. Setup UFW rules:

* The script then proceeds to set up some UFW (Uncomplicated Firewall) rules.
* `sudo ufw limit 22/tcp` limits incoming SSH (port 22) connections to prevent brute force attacks.
* `sudo ufw allow 80/tcp` allows incoming HTTP (port 80) connections.
* `sudo ufw allow 443/tcp` allows incoming HTTPS (port 443) connections.
* `sudo ufw default deny incoming` sets the default policy for incoming connections to deny.
* `sudo ufw default allow outgoing` sets the default policy for outgoing connections to allow.
* `sudo ufw enable` enables the UFW firewall with the defined rules.


### 3. Harden /etc/sysctl.conf:

This section modifies the kernel parameters in the sysctl configuration file (/etc/sysctl.conf) for improved security.
* `sudo sysctl -a` displays all current sysctl settings.
* `sudo sysctl -A` displays all current sysctl settings with their values.
* `sudo sysctl mib` displays the current MIB (Management Information Base) settings.
* `sudo sysctl net.ipv4.conf.all.rp_filter` displays the current reverse path filtering setting.
* `sudo sysctl -a --pattern 'net.ipv4.conf.(eth|wlan)0.arp'` displays the current ARP (Address Resolution Protocol) settings for network interfaces eth0 and wlan0.

**If you DON'T use VMs and nvidia drivers you can also add the following:**
* `sudo sysctl kernel.modules_disabled=1` disables the loading of kernel modules.

### 4. Prevent IP Spoofs:

This section modifies the /etc/host.conf file to prevent IP spoofing.
It sets the order of resolution to use "bind" and "hosts" and enables "multi" on the system.

### 5. Enable fail2ban:

This section enables and starts the fail2ban service for protecting against brute force attacks.
* `sudo cp jail.local /etc/fail2ban/` copies a configuration file named "jail.local" to the /etc/fail2ban/ directory.
* `sudo systemctl enable fail2ban` enables the fail2ban service to start automatically on boot.
* `sudo systemctl start fail2ban` starts the fail2ban service immediately.

### 6. Listening ports:

The script ends by displaying the listening ports using the `ss` command with the `-tunlp` options.