# #!/bin/sh

# dotnetDir="/opt/dotnet"

# if [ -d "/etc/dns/config" ]
# then
#     dnsDir="/etc/dns"
# else
#     dnsDir="/opt/technitium/dns"
# fi

# dnsTar="$dnsDir/DnsServerPortable.tar.gz"
# dnsUrl="https://download.technitium.com/dns/DnsServerPortable.tar.gz"

# mkdir -p $dnsDir
# installLog="$dnsDir/install.log"
# echo "" > $installLog

# echo ""
# echo "==============================="
# echo "Technitium DNS Server Installer"
# echo "==============================="

# if [ -d $dotnetDir ] && [ "$(dotnet --list-runtimes 2>/dev/null | grep -q "Microsoft.AspNetCore.App 7.0." && echo "yes" || echo "no")" = "yes" ]
# then
#     echo ""
#     echo "ASP.NET Core Runtime is already installed."
# else
#     echo ""
#     echo "Installing ASP.NET Core Runtime..."

#     apk add --no-cache curl icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib
#     curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin -c 7.0 --runtime aspnetcore --no-path --install-dir $dotnetDir --verbose >> $installLog 2>&1

#     if [ ! -f "/usr/bin/dotnet" ]
#     then
#         ln -s $dotnetDir/dotnet /usr/bin >> $installLog 2>&1
#     fi

#     if [ "$(dotnet --list-runtimes 2>/dev/null | grep -q "Microsoft.AspNetCore.App 7.0." && echo "yes" || echo "no")" = "yes" ]
#     then
#         echo "ASP.NET Core Runtime was installed successfully!"
#     else
#         echo "Failed to install ASP.NET Core Runtime. Please try again."
#         exit 1
#     fi
# fi

# echo ""
# echo "Downloading Technitium DNS Server..."

# if curl -o $dnsTar --fail $dnsUrl >> $installLog 2>&1
# then
#     if [ -d $dnsDir ]
#     then
#         echo "Updating Technitium DNS Server..."
#     else
#         echo "Installing Technitium DNS Server..."
#     fi
    
#     tar -zxf $dnsTar -C $dnsDir >> $installLog 2>&1
    
#     if [ -f "/etc/init.d/dns" ]
#     then
#         echo "Restarting init service..."
#         /etc/init.d/dns restart >> $installLog 2>&1
#     else
#         echo "Configuring init service..."
#         cp $dnsDir/init.d /etc/init.d/dns
#         chmod +x /etc/init.d/dns
#         rc-update add dns default >> $installLog 2>&1
        
#         /etc/init.d/dns start >> $installLog 2>&1
        
#         rm /etc/resolv.conf >> $installLog 2>&1
#         echo "nameserver 127.0.0.1" > /etc/resolv.conf 2>> $installLog
        
#         if [ -f "/etc/network/interfaces" ]
#         then
#             sed -i '/iface lo inet loopback/a dns-nameservers 127.0.0.1' /etc/network/interfaces
#         fi
#     fi
    
#     echo ""
#     echo "Technitium DNS Server was installed successfully!"
#     echo "Open http://$(hostname):5380/ to access the web console."
