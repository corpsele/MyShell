#!/bin/bash

echo '选择wifi'
echo '1.SHUNYI1+'
echo '2.SHUNYI2+'
echo '3.1103'
echo '4.关闭dns'
echo '5.SHUNYI1'
echo '6.SHUNYI2'
echo '7.nordvpn(SHUNYI1+ & norddns)'
echo '8.Set DNS to 192.168.0.101'
echo '9.Set DNS to NordVPN'

read index

case $index in
    1)  echo '正在切换顺义1...'
sudo networksetup -setairportnetwork en0 TP-SHUNYI1 TP-SHUNYI1
sudo networksetup -setdnsservers Wi-Fi 192.168.0.101
echo '切换完成'
    ;;
    2)  echo '正在切换顺义2...'
sudo networksetup -setairportnetwork en0 TP-SHUNYI2 TP-SHUNYI2
sudo networksetup -setdnsservers Wi-Fi 192.168.0.101
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
sudo networksetup -setdnsservers Wi-Fi 192.168.0.101
echo '切换完成'
    ;; 
    9)  echo '正在设置dns...'
sudo networksetup -setdnsservers Wi-Fi 103.86.96.100 103.86.99.100
echo '切换完成'
    ;; 
    *)  echo '输入不正确'
    ;;
esac