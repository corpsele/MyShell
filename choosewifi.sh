#!/bin/bash

echo '选择wifi'
echo '1.SHUNYI1+'
echo '2.SHUNYI2+'
echo '3.1103'
echo '4.关闭dns'
echo '5.SHUNYI1'
echo '6.SHUNYI2'
echo '7.nordvpn(SHUNYI1+ & norddns)'
echo '8.Set DNS to 172.17.64.172'
echo '9.Set DNS to NordVPN'
echo '0.TP-LINK_357636'
echo '11.A1112'
echo '12.Set DNS to 8.8.8.8'
echo '13.Set DNS to 114.114.114.114'
# echo '14.Set DNS to NordVPN'
echo '14.Set 357636 + DNS'
echo '15.Set DNS to 202.106.0.20'
echo '16.Set Wire DNS'
echo '17.Close Wire DNS'
echo '18.Set USB Ether DNS'
echo '19.Close USB Ether DNS'
echo '20.Change USB Ether MAC Address'
echo '21.Change group to shunyi ip'
echo '22.Set Default 20201109'
echo '23.Set Default DHCP'
echo '24.Open/Close Wifi'
echo '25.Set USB Ethernet Proxy for Developer'
echo '26.Open/Close Discovery Proxy'

read index

case $index in
    1)  echo '正在切换顺义1...'
sudo networksetup -setairportnetwork en0 TP-SHUNYI1 TP-SHUNYI1
sudo networksetup -setdnsservers Wi-Fi 172.17.64.172
echo '切换完成'
    ;;
    2)  echo '正在切换顺义2...'
sudo networksetup -setairportnetwork en0 TP-SHUNYI2 TP-SHUNYI2
sudo networksetup -setdnsservers Wi-Fi 172.17.64.172
echo '切换完成'
    ;;
    3)  echo '正在切换1103...'
sudo networksetup -setairportnetwork en0 A1103 P@ssw0rd
sudo networksetup -setdnsservers Wi-Fi empty
echo '切换完成'
    ;;
    4)  echo '关闭dns中...'
sudo networksetup -setdnsservers Wi-Fi empty
echo 'dns已关闭'
    ;;
    5)  echo '正在切换顺义1...'
sudo networksetup -setairportnetwork en0 TP-SHUNYI1 TP-SHUNYI1
sudo networksetup -setdnsservers Wi-Fi empty
echo '切换完成'
    ;;
    6)  echo '正在切换顺义2...'
sudo networksetup -setairportnetwork en0 TP-SHUNYI2 TP-SHUNYI2
sudo networksetup -setdnsservers Wi-Fi empty
echo '切换完成'
    ;;
    7)  echo '正在切换NordVPN...'
sudo networksetup -setairportnetwork en0 TP-SHUNYI1 TP-SHUNYI1
sudo networksetup -setdnsservers Wi-Fi 103.86.96.100 103.86.99.100
echo '切换完成'
    ;; 
    8)  echo '正在设置dns...'
sudo networksetup -setdnsservers Wi-Fi 172.17.64.172 202.106.0.20
echo '切换完成'
    ;; 
    9)  echo '正在设置dns...'
sudo networksetup -setdnsservers Wi-Fi 103.86.96.100 103.86.99.100
echo '切换完成'
    ;; 
    0)  echo '正在切换 TP-LINK_357636'
sudo networksetup -setairportnetwork en0 TP-LINK_357636 shunyi1113
echo '切换完成'
    ;;
    11) echo '正在切换 A1112'
    sudo networksetup -setairportnetwork en0 A1112 '1qaz2wsx!@'
    sudo networksetup -setdnsservers Wi-Fi empty
echo '切换完成'
    ;;
    12)  echo '正在设置dns...'
sudo networksetup -setdnsservers Wi-Fi 8.8.8.8
echo '切换完成'
    ;;
    13)  echo '正在设置dns...'
sudo networksetup -setdnsservers Wi-Fi 114.114.114.114
echo '切换完成'
    ;;
    # 14)  echo '正在设置dns...'
    # sudo networksetup -setdnsservers Wi-Fi 103.86.96.100 103.86.99.100
    # echo '设置完成'
    # ;;
    14)  echo '正在切换 357636 + DNS ...'
    sudo networksetup -setairportnetwork en0 TP-LINK_357636 shunyi1113
    sudo networksetup -setdnsservers Wi-Fi 172.17.64.172 202.106.0.20
    echo '切换完成'
    ;;
    15)  echo '正在设置dns...'
    sudo networksetup -setdnsservers Wi-Fi 202.106.0.20
    echo '切换完成'
    ;;
    16)  echo '正在设置有线dns...'
    sudo networksetup -setdnsservers 'Thunderbolt Ethernet' 172.17.64.172 202.106.0.20
    echo '切换完成'
    ;;
    17)  echo '正在关闭有线dns...'
    sudo networksetup -setdnsservers 'Thunderbolt Ethernet' empty
    echo '关闭完成'
    ;;
    18) echo '正在设置usb网卡dns...'
    sudo networksetup -setdnsservers 'USB Ethernet' 172.17.64.172 202.106.0.20
    echo '切换完成'
    ;;
    19) echo '关闭usb网卡dns...'
    sudo networksetup -setdnsservers 'USB Ethernet' empty
    echo '关闭完成'
    ;;
    20) echo '修改usb网卡mac地址...'
    sudo /sbin/ifconfig en9 ether 38:c9:86:43:35:fe
    networksetup -detectnewhardware
    echo '修改完成'
    ;;
    21) echo 'change group to shunyi ip'
    sudo networksetup -setmanual 'USB Ethernet' 10.99.213.205 255.255.255.0 10.99.213.250
    sudo networksetup -setdnsservers 'USB Ethernet' 10.99.101.11 10.99.101.101 10.99.101.102
    echo 'done'
    ;;
    22) echo 'Set Default'
    sudo networksetup -setmanual 'USB Ethernet' 172.17.7.6 255.255.255.0 172.17.7.254
    sudo networksetup -setdnsservers 'USB Ethernet' 172.17.64.172 114.114.114.114
    echo 'done'
    ;;
    23) echo 'Set Default DHCP'
    sudo networksetup -setdhcp 'USB Ethernet' empty
    sudo networksetup -setdnsservers 'USB Ethernet' empty
    echo 'done'
    ;;
    24) echo 'Open/Close Wifi'
        echo "1.Open Wifi"
        echo "2.Close Wifi"
        read flag
        case $flag in 
        1) echo "Open Wifi"
        sudo networksetup -setairportpower Wi-Fi on
        echo "Open Successed"
        ;;
        2) echo "Close Wifi"
        sudo networksetup -setairportpower Wi-Fi off
        echo "Close Successed"
        ;;
        esac
    ;;
    25) echo 'Set USB Ethernet Proxy for Developer'
    sudo networksetup -setwebproxy 'USB Ethernet' 172.17.32.196 3128
    sudo networksetup -setsecurewebproxy 'USB Ethernet' 172.17.32.196 3128
    sudo networksetup -setproxybypassdomains 'USB Ethernet' 'agentzshg.test.chinaport.gov.cn' 'emmzshg.test.chinaport.gov.cn' 'mazshg.test.chinaport.gov.cn' 'impush.test.chinaport.gov.cn' 'msstest.chinaport.gov.cn' 'apptest.singlewindow.cn'
    sudo networksetup -setdnsservers 'USB Ethernet' 172.17.64.172
    echo 'Set Successed'
    ;;
    26) echo 'Open/Close Discovery Proxy'
    echo 'Open Discovery Proxy'
    echo 'Close Discovery Proxy'
    read flag
    case $flag in 
    1) echo 'Open Discovery Proxy'
    sudo networksetup -setproxyautodiscovery 'USB Ethernet' on
    echo 'Open Successed'
    ;;
    2) echo 'Close Discovery Proxy'
    sudo networksetup -setproxyautodiscovery 'USB Ethernet' off
    echo 'Close Successed'
    ;;
    esac
    ;;
    *)  echo '输入不正确'
    ;;
esac

