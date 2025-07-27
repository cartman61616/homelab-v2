# Mumbles Cave Server Summary

*Generated on $(date)*

## System Information

### Hardware & OS
Linux mumbles-cave 6.8.0-64-generic #67-Ubuntu SMP PREEMPT_DYNAMIC Sun Jun 15 20:23:31 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux

Distributor ID:	Ubuntu
Description:	Ubuntu 24.04.2 LTS
Release:	24.04
Codename:	noble

 15:56:30 up 2 days, 14:16,  2 users,  load average: 8.19, 8.78, 8.53


### CPU Information
Architecture:                         x86_64
CPU op-mode(s):                       32-bit, 64-bit
Address sizes:                        39 bits physical, 48 bits virtual
Byte Order:                           Little Endian
CPU(s):                               4
On-line CPU(s) list:                  0-3
Vendor ID:                            GenuineIntel
Model name:                           Intel(R) Core(TM) i5-7500T CPU @ 2.70GHz
CPU family:                           6
Model:                                158
Thread(s) per core:                   1
Core(s) per socket:                   4
Socket(s):                            1
Stepping:                             9
CPU(s) scaling MHz:                   100%
CPU max MHz:                          800.0000
CPU min MHz:                          800.0000
BogoMIPS:                             1599.97
Flags:                                fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb pti ssbd ibrs ibpb stibp tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm arat pln pts hwp hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_l1d arch_capabilities
Virtualization:                       VT-x

### Memory Information
               total        used        free      shared  buff/cache   available
Mem:            31Gi       2.6Gi        17Gi        56Mi        11Gi        28Gi
Swap:          8.0Gi          0B       8.0Gi

### Storage Information
Filesystem                         Size  Used Avail Use% Mounted on
tmpfs                              3.2G  3.0M  3.2G   1% /run
efivarfs                           256K  205K   47K  82% /sys/firmware/efi/efivars
/dev/mapper/ubuntu--vg-ubuntu--lv   98G   23G   71G  25% /
tmpfs                               16G     0   16G   0% /dev/shm
tmpfs                              5.0M     0  5.0M   0% /run/lock
/dev/sda2                          2.0G  193M  1.6G  11% /boot
/dev/sda1                          1.1G  6.2M  1.1G   1% /boot/efi
tmpfs                              3.2G   16K  3.2G   1% /run/user/1000

NAME                      MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0                       7:0    0  73.9M  1 loop /snap/core22/2010
loop1                       7:1    0  73.9M  1 loop /snap/core22/2045
loop2                       7:2    0  50.9M  1 loop /snap/snapd/24718
loop3                       7:3    0  49.3M  1 loop /snap/snapd/24792
sda                         8:0    0 238.5G  0 disk 
├─sda1                      8:1    0     1G  0 part /boot/efi
├─sda2                      8:2    0     2G  0 part /boot
└─sda3                      8:3    0 235.4G  0 part 
  └─ubuntu--vg-ubuntu--lv 252:0    0   100G  0 lvm  /
sdb                         8:16   0 238.5G  0 disk 
├─sdb1                      8:17   0  1007K  0 part 
├─sdb2                      8:18   0     1G  0 part 
└─sdb3                      8:19   0 237.5G  0 part 

## Network Configuration

### Network Interfaces
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 14:b3:1f:0d:02:0b brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.213/24 metric 100 brd 192.168.0.255 scope global dynamic enp0s31f6
       valid_lft 66003sec preferred_lft 66003sec
    inet6 fd3d:cc92:77bd:f449:16b3:1fff:fe0d:20b/64 scope global dynamic mngtmpaddr noprefixroute 
       valid_lft 1672sec preferred_lft 1672sec
    inet6 fe80::16b3:1fff:fe0d:20b/64 scope link 
       valid_lft forever preferred_lft forever
3: wlp1s0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether f8:59:71:15:92:8a brd ff:ff:ff:ff:ff:ff
4: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    link/ether 02:42:88:66:a9:76 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
275: br-d388fee5ff5b: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:95:c0:43:c3 brd ff:ff:ff:ff:ff:ff
    inet 172.23.0.1/16 brd 172.23.255.255 scope global br-d388fee5ff5b
       valid_lft forever preferred_lft forever
    inet6 fe80::42:95ff:fec0:43c3/64 scope link 
       valid_lft forever preferred_lft forever
288: br-6f416ded687e: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:e8:5a:61:fd brd ff:ff:ff:ff:ff:ff
    inet 172.24.0.1/16 brd 172.24.255.255 scope global br-6f416ded687e
       valid_lft forever preferred_lft forever
    inet6 fe80::42:e8ff:fe5a:61fd/64 scope link 
       valid_lft forever preferred_lft forever
3882: veth2b160b5@if3881: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-35cf89ee97ae state UP group default 
    link/ether 3e:b9:59:1b:4c:c7 brd ff:ff:ff:ff:ff:ff link-netnsid 11
    inet6 fe80::3cb9:59ff:fe1b:4cc7/64 scope link 
       valid_lft forever preferred_lft forever
3884: veth51b3d5d@if3883: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f8c520b1122d state UP group default 
    link/ether 22:ee:54:d7:37:f4 brd ff:ff:ff:ff:ff:ff link-netnsid 11
    inet6 fe80::20ee:54ff:fed7:37f4/64 scope link 
       valid_lft forever preferred_lft forever
3886: veth201154d@if3885: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-13756d193a47 state UP group default 
    link/ether 0e:84:41:f6:27:d6 brd ff:ff:ff:ff:ff:ff link-netnsid 11
    inet6 fe80::c84:41ff:fef6:27d6/64 scope link 
       valid_lft forever preferred_lft forever
3888: vethf02ccd6@if3887: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-13756d193a47 state UP group default 
    link/ether 52:1e:79:ab:e2:80 brd ff:ff:ff:ff:ff:ff link-netnsid 10
    inet6 fe80::501e:79ff:feab:e280/64 scope link 
       valid_lft forever preferred_lft forever
3890: veth6a9605e@if3889: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f8c520b1122d state UP group default 
    link/ether ae:f0:e4:89:b0:9a brd ff:ff:ff:ff:ff:ff link-netnsid 10
    inet6 fe80::acf0:e4ff:fe89:b09a/64 scope link 
       valid_lft forever preferred_lft forever
120: br-35cf89ee97ae: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:66:0c:26:46 brd ff:ff:ff:ff:ff:ff
    inet 172.22.0.1/16 brd 172.22.255.255 scope global br-35cf89ee97ae
       valid_lft forever preferred_lft forever
    inet6 fe80::42:66ff:fe0c:2646/64 scope link 
       valid_lft forever preferred_lft forever
1924: veth91d1b43@if1923: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d388fee5ff5b state UP group default 
    link/ether 42:ab:fa:94:9b:0f brd ff:ff:ff:ff:ff:ff link-netnsid 20
    inet6 fe80::40ab:faff:fe94:9b0f/64 scope link 
       valid_lft forever preferred_lft forever
1930: veth6d0539f@if1929: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-13756d193a47 state UP group default 
    link/ether f6:b3:9f:da:95:58 brd ff:ff:ff:ff:ff:ff link-netnsid 20
    inet6 fe80::f4b3:9fff:feda:9558/64 scope link 
       valid_lft forever preferred_lft forever
1932: veth662ba32@if1931: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-35cf89ee97ae state UP group default 
    link/ether 6a:46:7c:0d:cc:1a brd ff:ff:ff:ff:ff:ff link-netnsid 20
    inet6 fe80::6846:7cff:fe0d:cc1a/64 scope link 
       valid_lft forever preferred_lft forever
1716: vetha382134@if1715: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d36e83b06538 state UP group default 
    link/ether 4a:e2:2f:3b:df:8b brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet6 fe80::48e2:2fff:fe3b:df8b/64 scope link 
       valid_lft forever preferred_lft forever
1976: veth8e3a3a7@if1975: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-6f416ded687e state UP group default 
    link/ether 56:a8:0b:e7:8a:6e brd ff:ff:ff:ff:ff:ff link-netnsid 12
    inet6 fe80::54a8:bff:fee7:8a6e/64 scope link 
       valid_lft forever preferred_lft forever
1978: veth50324b6@if1977: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-35cf89ee97ae state UP group default 
    link/ether 3a:98:88:f6:91:cb brd ff:ff:ff:ff:ff:ff link-netnsid 13
    inet6 fe80::3898:88ff:fef6:91cb/64 scope link 
       valid_lft forever preferred_lft forever
1980: veth2adf817@if1979: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-6f416ded687e state UP group default 
    link/ether 4a:9f:2c:5b:08:85 brd ff:ff:ff:ff:ff:ff link-netnsid 13
    inet6 fe80::489f:2cff:fe5b:885/64 scope link 
       valid_lft forever preferred_lft forever
1982: veth4928704@if1981: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-13756d193a47 state UP group default 
    link/ether fa:21:6d:1c:79:90 brd ff:ff:ff:ff:ff:ff link-netnsid 13
    inet6 fe80::f821:6dff:fe1c:7990/64 scope link 
       valid_lft forever preferred_lft forever
1738: vethf233153@if1737: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d36e83b06538 state UP group default 
    link/ether ea:15:13:63:23:38 brd ff:ff:ff:ff:ff:ff link-netnsid 4
    inet6 fe80::e815:13ff:fe63:2338/64 scope link 
       valid_lft forever preferred_lft forever
1740: vetha30bc59@if1739: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d36e83b06538 state UP group default 
    link/ether 16:13:c1:44:99:46 brd ff:ff:ff:ff:ff:ff link-netnsid 3
    inet6 fe80::1413:c1ff:fe44:9946/64 scope link 
       valid_lft forever preferred_lft forever
1742: vethd25912f@if1741: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d36e83b06538 state UP group default 
    link/ether 76:c1:63:83:db:94 brd ff:ff:ff:ff:ff:ff link-netnsid 1
    inet6 fe80::74c1:63ff:fe83:db94/64 scope link 
       valid_lft forever preferred_lft forever
1744: veth96fa8e1@if1743: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d36e83b06538 state UP group default 
    link/ether 4a:7a:20:e1:4c:ca brd ff:ff:ff:ff:ff:ff link-netnsid 6
    inet6 fe80::487a:20ff:fee1:4cca/64 scope link 
       valid_lft forever preferred_lft forever
1746: vetha8720b4@if1745: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d36e83b06538 state UP group default 
    link/ether 02:56:9b:f2:0e:8e brd ff:ff:ff:ff:ff:ff link-netnsid 2
    inet6 fe80::56:9bff:fef2:e8e/64 scope link 
       valid_lft forever preferred_lft forever
1748: vethc46b2c4@if1747: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-d36e83b06538 state UP group default 
    link/ether aa:52:0b:55:66:63 brd ff:ff:ff:ff:ff:ff link-netnsid 7
    inet6 fe80::a852:bff:fe55:6663/64 scope link 
       valid_lft forever preferred_lft forever
1750: veth9ff91cb@if1749: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-35cf89ee97ae state UP group default 
    link/ether 66:4f:bf:89:cb:4f brd ff:ff:ff:ff:ff:ff link-netnsid 4
    inet6 fe80::644f:bfff:fe89:cb4f/64 scope link 
       valid_lft forever preferred_lft forever
1752: veth1fc6e49@if1751: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-35cf89ee97ae state UP group default 
    link/ether f2:d6:f8:b6:f8:14 brd ff:ff:ff:ff:ff:ff link-netnsid 6
    inet6 fe80::f0d6:f8ff:feb6:f814/64 scope link 
       valid_lft forever preferred_lft forever
1753: br-13756d193a47: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:ee:ae:b6:3b brd ff:ff:ff:ff:ff:ff
    inet 172.25.0.1/16 brd 172.25.255.255 scope global br-13756d193a47
       valid_lft forever preferred_lft forever
    inet6 fe80::42:eeff:feae:b63b/64 scope link 
       valid_lft forever preferred_lft forever
1755: veth4e6d258@if1754: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-13756d193a47 state UP group default 
    link/ether 9a:1c:39:c9:03:c4 brd ff:ff:ff:ff:ff:ff link-netnsid 8
    inet6 fe80::981c:39ff:fec9:3c4/64 scope link 
       valid_lft forever preferred_lft forever
1759: vethad4bfd7@if1758: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-13756d193a47 state UP group default 
    link/ether f6:a0:6b:0d:11:4a brd ff:ff:ff:ff:ff:ff link-netnsid 9
    inet6 fe80::f4a0:6bff:fe0d:114a/64 scope link 
       valid_lft forever preferred_lft forever
1760: br-f8c520b1122d: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:8c:07:13:7c brd ff:ff:ff:ff:ff:ff
    inet 172.26.0.1/16 brd 172.26.255.255 scope global br-f8c520b1122d
       valid_lft forever preferred_lft forever
    inet6 fe80::42:8cff:fe07:137c/64 scope link 
       valid_lft forever preferred_lft forever
1762: veth0f0cca3@if1761: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-f8c520b1122d state UP group default 
    link/ether 7e:51:ab:0f:25:0f brd ff:ff:ff:ff:ff:ff link-netnsid 15
    inet6 fe80::7c51:abff:fe0f:250f/64 scope link 
       valid_lft forever preferred_lft forever
233: veth96e4b7a@if232: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-35cf89ee97ae state UP group default 
    link/ether 3a:93:90:3a:36:65 brd ff:ff:ff:ff:ff:ff link-netnsid 5
    inet6 fe80::3893:90ff:fe3a:3665/64 scope link 
       valid_lft forever preferred_lft forever
234: br-d36e83b06538: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:f0:27:38:a6 brd ff:ff:ff:ff:ff:ff
    inet 172.21.0.1/16 brd 172.21.255.255 scope global br-d36e83b06538
       valid_lft forever preferred_lft forever
    inet6 fe80::42:f0ff:fe27:38a6/64 scope link 
       valid_lft forever preferred_lft forever

### Network Routes
default via 192.168.0.1 dev enp0s31f6 proto dhcp src 192.168.0.213 metric 100 
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown 
172.21.0.0/16 dev br-d36e83b06538 proto kernel scope link src 172.21.0.1 
172.22.0.0/16 dev br-35cf89ee97ae proto kernel scope link src 172.22.0.1 
172.23.0.0/16 dev br-d388fee5ff5b proto kernel scope link src 172.23.0.1 
172.24.0.0/16 dev br-6f416ded687e proto kernel scope link src 172.24.0.1 
172.25.0.0/16 dev br-13756d193a47 proto kernel scope link src 172.25.0.1 
172.26.0.0/16 dev br-f8c520b1122d proto kernel scope link src 172.26.0.1 
192.168.0.0/24 dev enp0s31f6 proto kernel scope link src 192.168.0.213 metric 100 
192.168.0.1 dev enp0s31f6 proto dhcp scope link src 192.168.0.213 metric 100 

### DNS Configuration
# This is /run/systemd/resolve/stub-resolv.conf managed by man:systemd-resolved(8).
# Do not edit.
#
# This file might be symlinked as /etc/resolv.conf. If you're looking at
# /etc/resolv.conf and seeing this text, you have followed the symlink.
#
# This is a dynamic resolv.conf file for connecting local clients to the
# internal DNS stub resolver of systemd-resolved. This file lists all
# configured search domains.
#
# Run "resolvectl status" to see details about the uplink DNS servers
# currently in use.
#
# Third party programs should typically not access this file directly, but only
# through the symlink at /etc/resolv.conf. To manage man:resolv.conf(5) in a
# different way, replace this symlink by a static file or a different symlink.
#
# See man:systemd-resolved.service(8) for details about the supported modes of
# operation for /etc/resolv.conf.

nameserver 127.0.0.53
options edns0 trust-ad
search localdomain

## Services & Processes

### System Services (Running)
  UNIT                        LOAD   ACTIVE SUB     DESCRIPTION
  containerd.service          loaded active running containerd container runtime
  cron.service                loaded active running Regular background program processing daemon
  dbus.service                loaded active running D-Bus System Message Bus
  docker.service              loaded active running Docker Application Container Engine
  fail2ban.service            loaded active running Fail2Ban Service
  fwupd.service               loaded active running Firmware update daemon
  getty@tty1.service          loaded active running Getty on tty1
  ModemManager.service        loaded active running Modem Manager
  multipathd.service          loaded active running Device-Mapper Multipath Device Controller
  polkit.service              loaded active running Authorization Manager
  rsyslog.service             loaded active running System Logging Service
  snapd.service               loaded active running Snap Daemon
  ssh.service                 loaded active running OpenBSD Secure Shell server
  systemd-journald.service    loaded active running Journal Service
  systemd-logind.service      loaded active running User Login Management
  systemd-networkd.service    loaded active running Network Configuration
  systemd-resolved.service    loaded active running Network Name Resolution
  systemd-timesyncd.service   loaded active running Network Time Synchronization
  systemd-udevd.service       loaded active running Rule-based Manager for Device Events and Files
  thermald.service            loaded active running Thermal Daemon Service
  udisks2.service             loaded active running Disk Manager
  unattended-upgrades.service loaded active running Unattended Upgrades Shutdown
  upower.service              loaded active running Daemon for power management
  user@1000.service           loaded active running User Manager for UID 1000

Legend: LOAD   → Reflects whether the unit definition was properly loaded.
        ACTIVE → The high-level unit activation state, i.e. generalization of SUB.
        SUB    → The low-level unit activation state, values depend on unit type.

24 loaded units listed.

### Network Services & Listening Ports
State  Recv-Q Send-Q Local Address:Port  Peer Address:PortProcess
LISTEN 0      4096   127.0.0.53%lo:53         0.0.0.0:*          
LISTEN 0      4096         0.0.0.0:9443       0.0.0.0:*          
LISTEN 0      4096         0.0.0.0:9093       0.0.0.0:*          
LISTEN 0      4096         0.0.0.0:9090       0.0.0.0:*          
LISTEN 0      4096         0.0.0.0:9100       0.0.0.0:*          
LISTEN 0      4096         0.0.0.0:9000       0.0.0.0:*          
LISTEN 0      4096         0.0.0.0:3100       0.0.0.0:*          
LISTEN 0      4096         0.0.0.0:2283       0.0.0.0:*          
LISTEN 0      4096         0.0.0.0:3000       0.0.0.0:*          
LISTEN 0      4096       127.0.0.1:35229      0.0.0.0:*          
LISTEN 0      4096         0.0.0.0:80         0.0.0.0:*          
LISTEN 0      4096         0.0.0.0:443        0.0.0.0:*          
LISTEN 0      4096         0.0.0.0:8081       0.0.0.0:*          
LISTEN 0      4096         0.0.0.0:8080       0.0.0.0:*          
LISTEN 0      4096         0.0.0.0:6379       0.0.0.0:*          
LISTEN 0      4096      127.0.0.54:53         0.0.0.0:*          
LISTEN 0      4096         0.0.0.0:5432       0.0.0.0:*          
LISTEN 0      4096            [::]:9443          [::]:*          
LISTEN 0      4096            [::]:9093          [::]:*          
LISTEN 0      4096            [::]:9090          [::]:*          
LISTEN 0      4096            [::]:9100          [::]:*          
LISTEN 0      4096            [::]:9000          [::]:*          
LISTEN 0      4096            [::]:3100          [::]:*          
LISTEN 0      4096            [::]:2283          [::]:*          
LISTEN 0      4096            [::]:3000          [::]:*          
LISTEN 0      4096            [::]:80            [::]:*          
LISTEN 0      4096               *:22               *:*          
LISTEN 0      4096            [::]:443           [::]:*          
LISTEN 0      4096            [::]:8081          [::]:*          
LISTEN 0      4096            [::]:8080          [::]:*          
LISTEN 0      4096            [::]:6379          [::]:*          
LISTEN 0      4096            [::]:5432          [::]:*          

## NFS Configuration

### NFS Exports
No /etc/exports file found

### NFS Service Status
NFS service not found or not running

### Active NFS Shares
No NFS exports available or showmount not installed

### NFS Statistics
nfsstat not available

## Storage & Filesystems

### Mounted Filesystems
devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000)
/dev/mapper/ubuntu--vg-ubuntu--lv on / type ext4 (rw,relatime)
hugetlbfs on /dev/hugepages type hugetlbfs (rw,nosuid,nodev,relatime,pagesize=2M)
mqueue on /dev/mqueue type mqueue (rw,nosuid,nodev,noexec,relatime)
/var/lib/snapd/snaps/core22_2010.snap on /snap/core22/2010 type squashfs (ro,nodev,relatime,errors=continue,threads=single,x-gdu.hide,x-gvfs-hide)
/var/lib/snapd/snaps/core22_2045.snap on /snap/core22/2045 type squashfs (ro,nodev,relatime,errors=continue,threads=single,x-gdu.hide,x-gvfs-hide)
/var/lib/snapd/snaps/snapd_24718.snap on /snap/snapd/24718 type squashfs (ro,nodev,relatime,errors=continue,threads=single,x-gdu.hide,x-gvfs-hide)
/var/lib/snapd/snaps/snapd_24792.snap on /snap/snapd/24792 type squashfs (ro,nodev,relatime,errors=continue,threads=single,x-gdu.hide,x-gvfs-hide)
/dev/sda2 on /boot type ext4 (rw,relatime)
/dev/sda1 on /boot/efi type vfat (rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro)
overlay on /var/lib/docker/overlay2/5fc33c53c2740d3eef216ac40d8f800854e865f2d97a89197e1200314d7e6836/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/RL5OGZ6ETYXNLMYRRSJ2PATHGY:/var/lib/docker/overlay2/l/YMVO4ZPYB5BJXKP77E7JTRLHT3:/var/lib/docker/overlay2/l/WJQX5E27PQCC7L2UL7MLQUMQ2C:/var/lib/docker/overlay2/l/73IE3KKJFM4CXBIWSZP4R4ZM22:/var/lib/docker/overlay2/l/Z2C3PLWS3PQCBX4Y7HCXFRY4A7,upperdir=/var/lib/docker/overlay2/5fc33c53c2740d3eef216ac40d8f800854e865f2d97a89197e1200314d7e6836/diff,workdir=/var/lib/docker/overlay2/5fc33c53c2740d3eef216ac40d8f800854e865f2d97a89197e1200314d7e6836/work,nouserxattr)
nsfs on /run/docker/netns/b4400dab3061 type nsfs (rw)
overlay on /var/lib/docker/overlay2/882562d90c19bc1657aab063a45f9708a7a7a33cd841e27bda67ef763f518bc5/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/U52JHC32SQ4MUJKKUCYDYOXCBT:/var/lib/docker/overlay2/l/DTK7QNYRJUDGQ3VSHGUCEE36W7:/var/lib/docker/overlay2/l/TKPZKLURGWQBPQKDOZLCP6L6FK:/var/lib/docker/overlay2/l/4KY2BXD4T26VAALDCKBZYZRQ7Y:/var/lib/docker/overlay2/l/7TOIEXUVJBEYWPNX4BJ45DZMK4,upperdir=/var/lib/docker/overlay2/882562d90c19bc1657aab063a45f9708a7a7a33cd841e27bda67ef763f518bc5/diff,workdir=/var/lib/docker/overlay2/882562d90c19bc1657aab063a45f9708a7a7a33cd841e27bda67ef763f518bc5/work,nouserxattr)
nsfs on /run/docker/netns/cd591d417e5c type nsfs (rw)
overlay on /var/lib/docker/overlay2/6525a28ddac93b0aaee94bf88483c570634f43e1c81bbf012f88063c9f49137a/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/B2OQDPJJBGALYW5T5LOPKNHXJM:/var/lib/docker/overlay2/l/5S6DHWGA7GJOGCF7SCWTMBOG3X:/var/lib/docker/overlay2/l/YG52YAB7L4BO6FMDLBQITDF6VJ:/var/lib/docker/overlay2/l/UYWOFNKC2MVD6NMMRKW2P7FWNA:/var/lib/docker/overlay2/l/RHHYU3CMRLS56ZQJMYCGGDDVOJ:/var/lib/docker/overlay2/l/KLDS7JCC73FRVJ3WB2UU4NSWQ7:/var/lib/docker/overlay2/l/ZQVGLEJN2XTEGUWUKY3IB7ITOY:/var/lib/docker/overlay2/l/DKBTYQMNVOKUDVA2I5CDHRVDEH:/var/lib/docker/overlay2/l/BOJF2FI7R3ED76XCKCTNQJHIX4:/var/lib/docker/overlay2/l/HD6VBIOURCPMWBCRBVPX53YA57:/var/lib/docker/overlay2/l/KT5VNTLIKUD5IZKBWBE7J63TOX,upperdir=/var/lib/docker/overlay2/6525a28ddac93b0aaee94bf88483c570634f43e1c81bbf012f88063c9f49137a/diff,workdir=/var/lib/docker/overlay2/6525a28ddac93b0aaee94bf88483c570634f43e1c81bbf012f88063c9f49137a/work,nouserxattr)
overlay on /var/lib/docker/overlay2/3bc6ec97d17509a5b6380eb9d7aba3c67a62f61f3341a384fdb46e64355b1705/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/NEMDT6BTDUO3L76IBVF4KAQZR7:/var/lib/docker/overlay2/l/NZBKSSYW2D2DFJGZD74HF5LUW4:/var/lib/docker/overlay2/l/4EYO3IKKDKZFOEMFKDMKHVBA5G:/var/lib/docker/overlay2/l/P4IWKTYQGLKOXFAOEFXBINO54A:/var/lib/docker/overlay2/l/2UCSY2SNUKP4DY6ZGS6AQMUHXB:/var/lib/docker/overlay2/l/B4ME4MSIGTQUJVLHI2PUQG564K:/var/lib/docker/overlay2/l/XDYPRW3X3PCGDXKFHJOAGTJOH5:/var/lib/docker/overlay2/l/XZ7AP3LXP3MT3SBBXQVXHUYTZU:/var/lib/docker/overlay2/l/XGGNJROSL24B6WS4WYCLNED6FL:/var/lib/docker/overlay2/l/VHBZTSQR7HWG4MAV76VKMS2BLP:/var/lib/docker/overlay2/l/CMVYFLP2WF4IA2YXBVCWMGMHLK:/var/lib/docker/overlay2/l/P6HKLVAX3NJGYUPXZ7NIR72GVP:/var/lib/docker/overlay2/l/YDWY4UUM35P5PAGPXJZZFXFOPA:/var/lib/docker/overlay2/l/OQ2FBRIJ2AHAK72PKOEFDXNZNJ:/var/lib/docker/overlay2/l/ELWI3A4BYS5XJL2VK5IWGZN75H:/var/lib/docker/overlay2/l/QM6G6Y6YWNNQYWBOL3YAUFYEOB:/var/lib/docker/overlay2/l/IWAYPBPGRM5X6MPMITK5SMQPBQ,upperdir=/var/lib/docker/overlay2/3bc6ec97d17509a5b6380eb9d7aba3c67a62f61f3341a384fdb46e64355b1705/diff,workdir=/var/lib/docker/overlay2/3bc6ec97d17509a5b6380eb9d7aba3c67a62f61f3341a384fdb46e64355b1705/work,nouserxattr)
overlay on /var/lib/docker/overlay2/af53347494b3a2fbffb6c20d7d80811729b3bb4b9ef76e6fffc3fc68d472f10b/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/R3OWQRWQEIUCYQYFSBSXQWFQVV:/var/lib/docker/overlay2/l/NLQB4Z35CJQWG4ABYRQ2XGDHGA:/var/lib/docker/overlay2/l/II7HLZO7MLQRQZHABMD624JUPU:/var/lib/docker/overlay2/l/TJSY6BQYBLPIGCHRBBC6U2XP4C,upperdir=/var/lib/docker/overlay2/af53347494b3a2fbffb6c20d7d80811729b3bb4b9ef76e6fffc3fc68d472f10b/diff,workdir=/var/lib/docker/overlay2/af53347494b3a2fbffb6c20d7d80811729b3bb4b9ef76e6fffc3fc68d472f10b/work,nouserxattr)
overlay on /var/lib/docker/overlay2/e495af0fd8ec82b95bb821e0e3410dc74da0ba9b5f54d1a956b7f80c0df4c2ac/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/6U7SILVVOPJR2BC3X3R4AKPIHJ:/var/lib/docker/overlay2/l/4ART47NGAOMVD5JOP5WQYGEP3X:/var/lib/docker/overlay2/l/JTCFPVULRMGJY7TXOCDE73YIHU:/var/lib/docker/overlay2/l/BWXNYQ54J2GMHOCALP5WONHDYT:/var/lib/docker/overlay2/l/OL55GW5N7UXSEPQDV7LFZY7JQ3:/var/lib/docker/overlay2/l/K63HJBTRLU7NYBJLC5C2LK2ZXS:/var/lib/docker/overlay2/l/56RJQSFGFJNMIQX3ZB3S454PBZ:/var/lib/docker/overlay2/l/MZVHWORZYPHOD6CA64F7U2GPQM:/var/lib/docker/overlay2/l/KIBEJODBUAUY65VTWW4ACLYGFJ:/var/lib/docker/overlay2/l/II7HLZO7MLQRQZHABMD624JUPU:/var/lib/docker/overlay2/l/TJSY6BQYBLPIGCHRBBC6U2XP4C,upperdir=/var/lib/docker/overlay2/e495af0fd8ec82b95bb821e0e3410dc74da0ba9b5f54d1a956b7f80c0df4c2ac/diff,workdir=/var/lib/docker/overlay2/e495af0fd8ec82b95bb821e0e3410dc74da0ba9b5f54d1a956b7f80c0df4c2ac/work,nouserxattr)
overlay on /var/lib/docker/overlay2/d2f3242dbe5a02af0e4c35587f66775fb44072da7c5cf9ec2dcbdfdc1d5996de/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/VRFJLKPHUX34CSAZ6JRUX4OQ5B:/var/lib/docker/overlay2/l/WYD3BXEX6XABZTU6DMRFRKNYMW:/var/lib/docker/overlay2/l/KMK3DLULMIKG5RC2USDINY3CIR:/var/lib/docker/overlay2/l/JFMG5DIYPAV2T45X2Y3MWJ4EGQ:/var/lib/docker/overlay2/l/DDTOC7KJGJPS4KO67LW4T7CXXO:/var/lib/docker/overlay2/l/RLK37WCV4POE2SXFFXG33SB23M:/var/lib/docker/overlay2/l/II7HLZO7MLQRQZHABMD624JUPU:/var/lib/docker/overlay2/l/TJSY6BQYBLPIGCHRBBC6U2XP4C,upperdir=/var/lib/docker/overlay2/d2f3242dbe5a02af0e4c35587f66775fb44072da7c5cf9ec2dcbdfdc1d5996de/diff,workdir=/var/lib/docker/overlay2/d2f3242dbe5a02af0e4c35587f66775fb44072da7c5cf9ec2dcbdfdc1d5996de/work,nouserxattr)
overlay on /var/lib/docker/overlay2/57bff3241f05d31bccb24e73db1aba3e1fb27ca5f38311c2b2b5190e0448365e/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/OMQSIGKCOT2YK7EJDUJH4PCYPI:/var/lib/docker/overlay2/l/64OI72F4SVZXRO3HBRXAXOIIYS:/var/lib/docker/overlay2/l/A4WWUBCTQJDXI6NLMN2OU7DVWQ:/var/lib/docker/overlay2/l/Y2YNSTEW477BUCQM2YIZK2JQCJ:/var/lib/docker/overlay2/l/P6YZA6JPE3CCNIZ65SUMYKSQNZ:/var/lib/docker/overlay2/l/4M24SO3ZDJRLSHZNXUJROK7O2T,upperdir=/var/lib/docker/overlay2/57bff3241f05d31bccb24e73db1aba3e1fb27ca5f38311c2b2b5190e0448365e/diff,workdir=/var/lib/docker/overlay2/57bff3241f05d31bccb24e73db1aba3e1fb27ca5f38311c2b2b5190e0448365e/work,nouserxattr)
nsfs on /run/docker/netns/d539bd6209b4 type nsfs (rw)
nsfs on /run/docker/netns/a8d307ba3a48 type nsfs (rw)
nsfs on /run/docker/netns/9fc6a18807e9 type nsfs (rw)
nsfs on /run/docker/netns/93809ec756da type nsfs (rw)
nsfs on /run/docker/netns/ecd3f2413a79 type nsfs (rw)
nsfs on /run/docker/netns/d965db493c67 type nsfs (rw)
overlay on /var/lib/docker/overlay2/edadd5473e9bebb02de7dfa10fb6341e0f417da94c39ad3a7104ed82de7d439a/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/UCKMYUFN4PUDHEBAB5RXBJ7QIB:/var/lib/docker/overlay2/l/TEU67WL5CGCSV5TTQX7BUMYAU4:/var/lib/docker/overlay2/l/HUICBOL2QPM75R7DHZ7CJSBNOA:/var/lib/docker/overlay2/l/E42HQKR4KBEWP5VSFW3PHNYGE4:/var/lib/docker/overlay2/l/CMVIH7B5RH7JW2AIJTV7ACT3FH:/var/lib/docker/overlay2/l/JBDPSXGJ6GUMHUNCBZ5FWJQOFE:/var/lib/docker/overlay2/l/ZUGKBZHG3I7Y2EV7HWEIIVRXRP:/var/lib/docker/overlay2/l/5VFXFFYG3FNUNUTGSH6ZGQWMLF:/var/lib/docker/overlay2/l/QSBFPOBJQBAN5IQA42CHGOAHXM,upperdir=/var/lib/docker/overlay2/edadd5473e9bebb02de7dfa10fb6341e0f417da94c39ad3a7104ed82de7d439a/diff,workdir=/var/lib/docker/overlay2/edadd5473e9bebb02de7dfa10fb6341e0f417da94c39ad3a7104ed82de7d439a/work,nouserxattr)
nsfs on /run/docker/netns/0dce83e1297b type nsfs (rw)
overlay on /var/lib/docker/overlay2/2a27898b8f7d703b7328c80a4bd0cfea13d8b55383c194bf7a0dbb701472689a/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/SXJZX2WFYON4M5OOGERZNCQPOB:/var/lib/docker/overlay2/l/IYLQ4IWXFIZNI2QF4H6AACSQRQ:/var/lib/docker/overlay2/l/YUKCDPKEFF64OL67AIY4IBDQ6T:/var/lib/docker/overlay2/l/XPDVUAQF7FGY33R7632YH34M3O:/var/lib/docker/overlay2/l/4ZALZRTS5ZNNUHGS5XJKHQLWC3:/var/lib/docker/overlay2/l/3W64HEC2J4ZEPQQ5DHEHSQRT24:/var/lib/docker/overlay2/l/FVS2NKGHCG3S5ACHDQXTI3PGCV:/var/lib/docker/overlay2/l/237AABIHR5XE54PITNDVZUN37J:/var/lib/docker/overlay2/l/5QVOQOA5JYZSCG5HV3DPP2SSHH:/var/lib/docker/overlay2/l/NCZ7UNAQC3EOWV7RPKUCI7Q7J7:/var/lib/docker/overlay2/l/L4KONIHMKTLJB5ILYQ4KPXTEVS:/var/lib/docker/overlay2/l/KT5VNTLIKUD5IZKBWBE7J63TOX,upperdir=/var/lib/docker/overlay2/2a27898b8f7d703b7328c80a4bd0cfea13d8b55383c194bf7a0dbb701472689a/diff,workdir=/var/lib/docker/overlay2/2a27898b8f7d703b7328c80a4bd0cfea13d8b55383c194bf7a0dbb701472689a/work,nouserxattr)
nsfs on /run/docker/netns/17687c2643b6 type nsfs (rw)
overlay on /var/lib/docker/overlay2/94d7b7f85b80a51cd03cda81bf046b173698f4bcd3c2a5dfa04e6fec48ec18cb/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/JOLV3XUTMYZC554QFAAWPOO4KM:/var/lib/docker/overlay2/l/XSZXB5WGOPS7DPF2PZNEO6FXMD:/var/lib/docker/overlay2/l/QJYQNWEDDU6JHGEWRMMETFIQUK:/var/lib/docker/overlay2/l/VTBWKTQCA7FX2ASC637A2UH4XW:/var/lib/docker/overlay2/l/YBBEWVVUXJ5JFQRBW7VAYJENE3:/var/lib/docker/overlay2/l/ECK52EYR6GPQUVKKSSCUVCYNY3:/var/lib/docker/overlay2/l/V3URIANVRQVVBBIR2JXZWNHXKB:/var/lib/docker/overlay2/l/7PN6GOWUO3YAW5I7X7ZYOHICGK:/var/lib/docker/overlay2/l/MB5O6TYXHCSN35JCTHKYZSZWLA:/var/lib/docker/overlay2/l/CMJEBEZUCH5MELAX67UI5VHFIJ:/var/lib/docker/overlay2/l/UBHSHI7FEITM5OQ44NG22BLQIU:/var/lib/docker/overlay2/l/6QSKP4RMXDDAVGT4FKHMDOIWWC,upperdir=/var/lib/docker/overlay2/94d7b7f85b80a51cd03cda81bf046b173698f4bcd3c2a5dfa04e6fec48ec18cb/diff,workdir=/var/lib/docker/overlay2/94d7b7f85b80a51cd03cda81bf046b173698f4bcd3c2a5dfa04e6fec48ec18cb/work,nouserxattr)
nsfs on /run/docker/netns/d4aa4a7c2af0 type nsfs (rw)
overlay on /var/lib/docker/overlay2/786e4fdf0579c89ef0eb7f23b666f8d556dc24aed2abe8ada29c0d83a0a483bc/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/BLBNA5I3GRFCJEKXI7UIASJN5I:/var/lib/docker/overlay2/l/ZWYTJS3D4XC2D2V2LFOVYAGZGV:/var/lib/docker/overlay2/l/NBO5SX3APOVVFCRARUXCJ4XLKJ:/var/lib/docker/overlay2/l/NQ6MWMPIQ2NRLEW3GXMNWQOSIB:/var/lib/docker/overlay2/l/DZ3DZZAELSUIPZVQN4I7XKXQHV:/var/lib/docker/overlay2/l/BSKS3TNOT6AFMGVRQB6P7M4E24:/var/lib/docker/overlay2/l/FWUVF5T67RY4365TGLMQOYRENI:/var/lib/docker/overlay2/l/6NIXNOVIGAWC7KUZAE75YLQMIL:/var/lib/docker/overlay2/l/GQJPGWQTRNOZ4YNFBHALE4FBMT:/var/lib/docker/overlay2/l/3THYYUE5C3O6E4FD6MVVAZTSMY:/var/lib/docker/overlay2/l/W6J5GPBD3KPFE6CCPCU7C3IL75:/var/lib/docker/overlay2/l/L26YVOW5V5GSBBZGVV63H44353:/var/lib/docker/overlay2/l/TGACEZKJPOQ2WIJQ5N44VAG37F:/var/lib/docker/overlay2/l/4CJ3D3KC6VMEBTWQAPM7KEUYAD:/var/lib/docker/overlay2/l/JF57FRXVBQP3ASRG3UMDO4NGFF:/var/lib/docker/overlay2/l/VUPDQFAZUONPWDRQDYONPVRIET:/var/lib/docker/overlay2/l/MU7JRJYOI6PVD6OB3VM5BWZ7V4:/var/lib/docker/overlay2/l/E5KZL3CL2LN6PZMCKQRQGL45UT:/var/lib/docker/overlay2/l/CK5ILDZGRTNW365KI722AVD5IZ:/var/lib/docker/overlay2/l/RLR7OUL6FDQGBFHEFP5FDD3YWV:/var/lib/docker/overlay2/l/KDUJJA5W2ZUJA4MN2JEJURXEFF:/var/lib/docker/overlay2/l/BD4KWDDM6WDGDRWLUPSKXP3X55:/var/lib/docker/overlay2/l/RTEAPBRREHUAK2VLXLA6R4ZICE:/var/lib/docker/overlay2/l/7LDVQZCICD7VQKJMP6A7YNBMQH:/var/lib/docker/overlay2/l/CZXBA7EWAY464JHKVHPV6YSMZS:/var/lib/docker/overlay2/l/IIP2B7YOIJ7WM4OTW4LF7C7O3O:/var/lib/docker/overlay2/l/IYTOYXGSRTOY5YPK6HVXIRNLNE:/var/lib/docker/overlay2/l/KQCBH7AZKF5GQAJ3YLKRA5CDAZ,upperdir=/var/lib/docker/overlay2/786e4fdf0579c89ef0eb7f23b666f8d556dc24aed2abe8ada29c0d83a0a483bc/diff,workdir=/var/lib/docker/overlay2/786e4fdf0579c89ef0eb7f23b666f8d556dc24aed2abe8ada29c0d83a0a483bc/work,nouserxattr)
nsfs on /run/docker/netns/1c9c2cb89fdd type nsfs (rw)
overlay on /var/lib/docker/overlay2/e8ac62cc7ef014d2a2857b3f3133f089cfbd4558f4212c60eb0d568ed95c0382/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/3SCDTOSSLNBV3XZOKHPSQDQAYC:/var/lib/docker/overlay2/l/XO2LXH3OCWGQVDI4RQNC252WVV:/var/lib/docker/overlay2/l/NARAYDVUACGLBYDQQ7W7XTU5VS:/var/lib/docker/overlay2/l/RGGOJNA4TNCFBKBQMPM54MLRLO:/var/lib/docker/overlay2/l/F4FO2P7UUNOD2Y5AZMTKN6RWVW:/var/lib/docker/overlay2/l/C5LPKCWM22RYE7NT2V57BYNMFJ:/var/lib/docker/overlay2/l/GLKBX52KDLAFLK3PASDZBEQXAU:/var/lib/docker/overlay2/l/KSQJP43MRT5PJTINNYN6G2ZIKA:/var/lib/docker/overlay2/l/NSNEW4PT4QIPCARPBR4BB2LS6D,upperdir=/var/lib/docker/overlay2/e8ac62cc7ef014d2a2857b3f3133f089cfbd4558f4212c60eb0d568ed95c0382/diff,workdir=/var/lib/docker/overlay2/e8ac62cc7ef014d2a2857b3f3133f089cfbd4558f4212c60eb0d568ed95c0382/work,nouserxattr)
nsfs on /run/docker/netns/8b4a09c082c6 type nsfs (rw)
overlay on /var/lib/docker/overlay2/e88b78a5ca3f8bbf4bb8b7d43c47f81f1978190b71c96ca5dff0862692d86406/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/ROMBENXPQDD33KEKLOV4KD4OBD:/var/lib/docker/overlay2/l/YOLC6T4CEEB74QCKTXZM6WJURK:/var/lib/docker/overlay2/l/D4A7JGYG7IQSJRC7VZORADOGRK:/var/lib/docker/overlay2/l/O5NJIOBIHUPESKOZTTYK652NCG:/var/lib/docker/overlay2/l/7FWPPJO6JVDEZ4IVSHSE4J7O4V:/var/lib/docker/overlay2/l/RTWDSCQYS5TQ7YBB7GH47FEMWS:/var/lib/docker/overlay2/l/LZAQS37AXWGWW2JSREEAFP22WZ:/var/lib/docker/overlay2/l/AZC5NLJICVNGUFG5LNHAKTQO4R:/var/lib/docker/overlay2/l/JWO526TYRJYTW624BOXKFJE6PL:/var/lib/docker/overlay2/l/TMBDCVP4MVANOG5Q6XEG7J6B6E:/var/lib/docker/overlay2/l/4RQIGGTLUXT7OV6W4QLBCLOAEJ:/var/lib/docker/overlay2/l/YECZZJ3VDOPDOFJAI2EC4R5EKT:/var/lib/docker/overlay2/l/QWOVPUB2UR6PCGU23WDNVGP6QK:/var/lib/docker/overlay2/l/BI4CY6IR3UD6ALM6GV3GXXMNAI:/var/lib/docker/overlay2/l/ROUQSQ2IRZKRQKWB6JI53XCYT7:/var/lib/docker/overlay2/l/GJ5HJXCGQEXA6G3RQ4KMAFYAON:/var/lib/docker/overlay2/l/PWL5OJK64PY4OL5NSZAS3Z5IT3:/var/lib/docker/overlay2/l/IT5DVSOJQGDS4KVOHQXZNNTUVA:/var/lib/docker/overlay2/l/7N7NEM23G3IZGOGGPF6DOI3D62:/var/lib/docker/overlay2/l/QL62B2775AKGSOU7EINNEXDT44:/var/lib/docker/overlay2/l/TYWNYC7N2MPVWKQIYK3D2MK3E3:/var/lib/docker/overlay2/l/EZBXEC6YTTLYJLGFR36WRJOQNH:/var/lib/docker/overlay2/l/QUI4OUYETFFBOBB5JHGJJRFKZR:/var/lib/docker/overlay2/l/6TSVM7DWO2LRVA2RDDSXJCPX43,upperdir=/var/lib/docker/overlay2/e88b78a5ca3f8bbf4bb8b7d43c47f81f1978190b71c96ca5dff0862692d86406/diff,workdir=/var/lib/docker/overlay2/e88b78a5ca3f8bbf4bb8b7d43c47f81f1978190b71c96ca5dff0862692d86406/work,nouserxattr)
nsfs on /run/docker/netns/75fc9c738d98 type nsfs (rw)
overlay on /var/lib/docker/overlay2/70cb1d4d60cdeb26fbb1f2380b2ffbce7c26ec4565104d4a5031d00c211325ff/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/LRW4C3GDAAMEBKWN5G3NMDLCIP:/var/lib/docker/overlay2/l/SSBJ3RZSUX2P7NCXQ7D652POPL:/var/lib/docker/overlay2/l/25HMUL2GFJJAHTKE5P25YLBU5L:/var/lib/docker/overlay2/l/A7IODCNNVUBSEZCZHGUZ77QIIG:/var/lib/docker/overlay2/l/6AIGKA6K5F53XPEORXATKDPC7A:/var/lib/docker/overlay2/l/MGHHLDOE4I4CI7W6WOEWV4PQMV:/var/lib/docker/overlay2/l/6FM4UALYFVA6MXIJRO4E2MEXQF:/var/lib/docker/overlay2/l/QB6EDLCBVKSKEM5HITYRMZRCOM:/var/lib/docker/overlay2/l/UPU6A77SABZ5PMG5K2I3D7PPUU:/var/lib/docker/overlay2/l/KAH4QVEGWIDIT37CPKKZ4UXDXO:/var/lib/docker/overlay2/l/BQD7UOTOEL5KOWC5TFN2O2YI5Q:/var/lib/docker/overlay2/l/6D3PEL25MUQO4UOP5F7VTNI4FL:/var/lib/docker/overlay2/l/EBUHYU2RTR3IQNILU3YZLSAW6X:/var/lib/docker/overlay2/l/I5KLDEXWR5YSGTQA3LZ5OCWPG3:/var/lib/docker/overlay2/l/5AZQTQ4HZUZ5FWIEO5LWUUCYDI:/var/lib/docker/overlay2/l/TG5T6H7R6B5HQBVGHWFYWDAVLX:/var/lib/docker/overlay2/l/5Z2QPYC5NVX2XDG2HKTGO2X4PT:/var/lib/docker/overlay2/l/2IE2KZ3NTRVCD43KE356YKVTW6:/var/lib/docker/overlay2/l/GPFMW75RSUZCD7IWTOGGBJROOV:/var/lib/docker/overlay2/l/TAM5HMVZEUQVNFZOFGLSK66FRT:/var/lib/docker/overlay2/l/MRZ7QHXAPJM5ZMG2APYKFQLH6Y:/var/lib/docker/overlay2/l/A5CAWJJ2HVEB35TV5NMIQQ26GH:/var/lib/docker/overlay2/l/KQCBH7AZKF5GQAJ3YLKRA5CDAZ,upperdir=/var/lib/docker/overlay2/70cb1d4d60cdeb26fbb1f2380b2ffbce7c26ec4565104d4a5031d00c211325ff/diff,workdir=/var/lib/docker/overlay2/70cb1d4d60cdeb26fbb1f2380b2ffbce7c26ec4565104d4a5031d00c211325ff/work,nouserxattr)
nsfs on /run/docker/netns/2564865207ea type nsfs (rw)
overlay on /var/lib/docker/overlay2/458d57426bed664546b24481584108595d72ef00cb0f79489331c76277476a97/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/E7Q6UXO3BKFSM3TYALM22ZKHHS:/var/lib/docker/overlay2/l/SSBJ3RZSUX2P7NCXQ7D652POPL:/var/lib/docker/overlay2/l/25HMUL2GFJJAHTKE5P25YLBU5L:/var/lib/docker/overlay2/l/A7IODCNNVUBSEZCZHGUZ77QIIG:/var/lib/docker/overlay2/l/6AIGKA6K5F53XPEORXATKDPC7A:/var/lib/docker/overlay2/l/MGHHLDOE4I4CI7W6WOEWV4PQMV:/var/lib/docker/overlay2/l/6FM4UALYFVA6MXIJRO4E2MEXQF:/var/lib/docker/overlay2/l/QB6EDLCBVKSKEM5HITYRMZRCOM:/var/lib/docker/overlay2/l/UPU6A77SABZ5PMG5K2I3D7PPUU:/var/lib/docker/overlay2/l/KAH4QVEGWIDIT37CPKKZ4UXDXO:/var/lib/docker/overlay2/l/BQD7UOTOEL5KOWC5TFN2O2YI5Q:/var/lib/docker/overlay2/l/6D3PEL25MUQO4UOP5F7VTNI4FL:/var/lib/docker/overlay2/l/EBUHYU2RTR3IQNILU3YZLSAW6X:/var/lib/docker/overlay2/l/I5KLDEXWR5YSGTQA3LZ5OCWPG3:/var/lib/docker/overlay2/l/5AZQTQ4HZUZ5FWIEO5LWUUCYDI:/var/lib/docker/overlay2/l/TG5T6H7R6B5HQBVGHWFYWDAVLX:/var/lib/docker/overlay2/l/5Z2QPYC5NVX2XDG2HKTGO2X4PT:/var/lib/docker/overlay2/l/2IE2KZ3NTRVCD43KE356YKVTW6:/var/lib/docker/overlay2/l/GPFMW75RSUZCD7IWTOGGBJROOV:/var/lib/docker/overlay2/l/TAM5HMVZEUQVNFZOFGLSK66FRT:/var/lib/docker/overlay2/l/MRZ7QHXAPJM5ZMG2APYKFQLH6Y:/var/lib/docker/overlay2/l/A5CAWJJ2HVEB35TV5NMIQQ26GH:/var/lib/docker/overlay2/l/KQCBH7AZKF5GQAJ3YLKRA5CDAZ,upperdir=/var/lib/docker/overlay2/458d57426bed664546b24481584108595d72ef00cb0f79489331c76277476a97/diff,workdir=/var/lib/docker/overlay2/458d57426bed664546b24481584108595d72ef00cb0f79489331c76277476a97/work,nouserxattr)
nsfs on /run/docker/netns/ff11954aab4b type nsfs (rw)

### Directory Sizes
Home directories:
606M	/home/mumbles

Var directories:
2.0M	/var/backups
138M	/var/cache
4.0K	/var/crash
486M	/var/lib
4.0K	/var/local
0	/var/lock
76M	/var/log
4.0K	/var/mail
4.0K	/var/opt
0	/var/run

## User Information

### Currently Logged In Users
mumbles  pts/1        2025-07-27 15:55 (192.168.0.44)

### Recent Login History
mumbles  pts/1        192.168.0.44     Sun Jul 27 15:55   still logged in
mumbles  pts/0        192.168.0.44     Sun Jul 27 14:47 - 15:55  (01:07)
mumbles  pts/0        192.168.0.44     Fri Jul 25 22:52 - 14:47 (1+15:54)
mumbles  pts/0        192.168.0.44     Fri Jul 25 01:40 - 22:51  (21:10)
reboot   system boot  6.8.0-64-generic Fri Jul 25 01:40   still running
mumbles  pts/0        192.168.0.44     Fri Jul 25 01:34 - 01:39  (00:05)
mumbles  pts/0        192.168.0.44     Sun Jul 20 16:36 - 17:00  (00:23)
reboot   system boot  6.8.0-63-generic Sun Jul 13 19:33 - 01:39 (11+06:06)
reboot   system boot  6.8.0-63-generic Sat Jul  5 12:38 - 01:39 (19+13:01)
mumbles  pts/0        192.168.0.44     Thu Jul  3 15:05 - 04:03  (12:58)

### User Accounts (with login shells)
root:x:0:0:root:/root:/bin/bash
sync:x:4:65534:sync:/bin:/bin/sync
mumbles:x:1000:1000:jonathan:/home/mumbles:/bin/bash

## Security & Firewall

### Firewall Status

### SSH Configuration
Include /etc/ssh/sshd_config.d/*.conf
KbdInteractiveAuthentication no
UsePAM yes
X11Forwarding yes
PrintMotd no
AcceptEnv LANG LC_*
Subsystem	sftp	/usr/lib/openssh/sftp-server

## System Logs (Recent)

### System Log Entries (Last 20)
2025-07-27T15:56:24.640312+00:00 mumbles-cave kernel: vethf02ccd6: entered promiscuous mode
2025-07-27T15:56:24.644047+00:00 mumbles-cave systemd-networkd[678]: vethf02ccd6: Link UP
2025-07-27T15:56:24.678708+00:00 mumbles-cave dockerd[902]: time="2025-07-27T15:56:24.675597981Z" level=info msg="No non-localhost DNS nameservers are left in resolv.conf. Using default external servers"
2025-07-27T15:56:24.724674+00:00 mumbles-cave kernel: br-f8c520b1122d: port 2(veth6a9605e) entered blocking state
2025-07-27T15:56:24.724711+00:00 mumbles-cave kernel: br-f8c520b1122d: port 2(veth6a9605e) entered disabled state
2025-07-27T15:56:24.730684+00:00 mumbles-cave kernel: veth6a9605e: entered allmulticast mode
2025-07-27T15:56:24.730716+00:00 mumbles-cave kernel: veth6a9605e: entered promiscuous mode
2025-07-27T15:56:24.733783+00:00 mumbles-cave systemd-networkd[678]: veth6a9605e: Link UP
2025-07-27T15:56:24.740391+00:00 mumbles-cave dockerd[902]: time="2025-07-27T15:56:24.739273975Z" level=info msg="No non-localhost DNS nameservers are left in resolv.conf. Using default external servers"
2025-07-27T15:56:25.024153+00:00 mumbles-cave systemd[1]: Started docker-c723ee368acd73a1b27cc731903abbcd4f414be5949ba444788ae06c5b1ed1b1.scope - libcontainer container c723ee368acd73a1b27cc731903abbcd4f414be5949ba444788ae06c5b1ed1b1.
2025-07-27T15:56:25.349290+00:00 mumbles-cave kernel: eth0: renamed from veth5837a30
2025-07-27T15:56:25.362466+00:00 mumbles-cave kernel: br-f8c520b1122d: port 2(veth6a9605e) entered blocking state
2025-07-27T15:56:25.362498+00:00 mumbles-cave kernel: br-f8c520b1122d: port 2(veth6a9605e) entered forwarding state
2025-07-27T15:56:25.365334+00:00 mumbles-cave systemd-networkd[678]: veth6a9605e: Gained carrier
2025-07-27T15:56:25.414452+00:00 mumbles-cave kernel: eth1: renamed from veth9d51d21
2025-07-27T15:56:25.426628+00:00 mumbles-cave systemd-networkd[678]: vethf02ccd6: Gained carrier
2025-07-27T15:56:25.427006+00:00 mumbles-cave kernel: br-13756d193a47: port 5(vethf02ccd6) entered blocking state
2025-07-27T15:56:25.427020+00:00 mumbles-cave kernel: br-13756d193a47: port 5(vethf02ccd6) entered forwarding state
2025-07-27T15:56:26.622869+00:00 mumbles-cave systemd-networkd[678]: veth6a9605e: Gained IPv6LL
2025-07-27T15:56:27.136837+00:00 mumbles-cave systemd-networkd[678]: vethf02ccd6: Gained IPv6LL

### Authentication Log Entries (Last 10)
2025-07-27T15:54:43.201960+00:00 mumbles-cave sshd[957421]: message repeated 36 times: [ error: no more sessions]
2025-07-27T15:55:01.615604+00:00 mumbles-cave CRON[1066100]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
2025-07-27T15:55:01.632915+00:00 mumbles-cave CRON[1066100]: pam_unix(cron:session): session closed for user root
2025-07-27T15:55:02.609436+00:00 mumbles-cave sshd[1065923]: Accepted password for mumbles from 192.168.0.44 port 57111 ssh2
2025-07-27T15:55:02.618140+00:00 mumbles-cave sshd[1065923]: pam_unix(sshd:session): session opened for user mumbles(uid=1000) by mumbles(uid=0)
2025-07-27T15:55:02.644038+00:00 mumbles-cave systemd-logind[736]: New session 453 of user mumbles.
2025-07-27T15:55:42.988391+00:00 mumbles-cave sshd[957421]: Received disconnect from 192.168.0.44 port 62582:11: disconnected by user
2025-07-27T15:55:42.997633+00:00 mumbles-cave sshd[957421]: Disconnected from user mumbles 192.168.0.44 port 62582
2025-07-27T15:55:43.001768+00:00 mumbles-cave sshd[957194]: pam_unix(sshd:session): session closed for user mumbles
2025-07-27T15:55:43.004903+00:00 mumbles-cave systemd-logind[736]: Session 443 logged out. Waiting for processes to exit.

## Package Information

### Recently Installed/Updated Packages
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                                 Version                                 Architecture Description
+++-====================================-=======================================-============-================================================================================
ii  1password-cli                        2.31.1-2                                amd64        The official 1Password command-line tool.
ii  adduser                              3.137ubuntu1                            all          add and remove users and groups
ii  amd64-microcode                      3.20250311.1ubuntu0.24.04.1             amd64        Processor microcode firmware for AMD CPUs
ii  apache2-utils                        2.4.58-1ubuntu8.7                       amd64        Apache HTTP Server (utility programs for web servers)
ii  apparmor                             4.0.1really4.0.1-0ubuntu0.24.04.4       amd64        user-space parser utility for AppArmor
ii  apport                               2.28.1-0ubuntu3.8                       all          automatically generate crash reports for debugging
ii  apport-core-dump-handler             2.28.1-0ubuntu3.8                       all          Kernel core dump handler for Apport
ii  apport-symptoms                      0.25                                    all          symptom scripts for apport
ii  appstream                            1.0.2-1build6                           amd64        Software component metadata management
ii  apt                                  2.8.3                                   amd64        commandline package manager
ii  apt-utils                            2.8.3                                   amd64        package management related utility programs
ii  base-files                           13ubuntu10.2                            amd64        Debian base system miscellaneous files
ii  base-passwd                          3.6.3build1                             amd64        Debian base system master password and group files
ii  bash                                 5.2.21-2ubuntu4                         amd64        GNU Bourne Again SHell
ii  bash-completion                      1:2.11-8                                all          programmable completion for the bash shell
ii  bc                                   1.07.1-3ubuntu4                         amd64        GNU bc arbitrary precision calculator language
ii  bcache-tools                         1.0.8-5build1                           amd64        bcache userspace tools
ii  bind9-dnsutils                       1:9.18.30-0ubuntu0.24.04.2              amd64        Clients provided with BIND 9
ii  bind9-host                           1:9.18.30-0ubuntu0.24.04.2              amd64        DNS Lookup Utility
ii  bind9-libs:amd64                     1:9.18.30-0ubuntu0.24.04.2              amd64        Shared Libraries used by BIND 9
ii  bolt                                 0.9.7-1                                 amd64        system daemon to manage thunderbolt 3 devices
ii  bpfcc-tools                          0.29.1+ds-1ubuntu7                      all          tools for BPF Compiler Collection (BCC)
ii  bpftrace                             0.20.2-1ubuntu4.3                       amd64        high-level tracing language for Linux eBPF
ii  bridge-utils                         1.7.1-1ubuntu2                          amd64        Utilities for configuring the Linux Ethernet bridge
ii  bsdextrautils                        2.39.3-9ubuntu6.2                       amd64        extra utilities from 4.4BSD-Lite

---
*End of Server Summary*
