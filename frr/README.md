# FRR

Setup Commands:

```
$ clab deploy

$ docker logs clab-frr-host_a | tail  
64 bytes from 192.168.4.2: icmp_seq=41 ttl=61 time=0.060 ms
64 bytes from 192.168.4.2: icmp_seq=42 ttl=61 time=0.046 ms
64 bytes from 192.168.4.2: icmp_seq=43 ttl=61 time=0.054 ms
64 bytes from 192.168.4.2: icmp_seq=44 ttl=61 time=0.079 ms
64 bytes from 192.168.4.2: icmp_seq=45 ttl=61 time=0.076 ms
64 bytes from 192.168.4.2: icmp_seq=46 ttl=61 time=0.085 ms
64 bytes from 192.168.4.2: icmp_seq=47 ttl=61 time=0.051 ms
64 bytes from 192.168.4.2: icmp_seq=48 ttl=61 time=0.109 ms
64 bytes from 192.168.4.2: icmp_seq=49 ttl=61 time=0.060 ms
64 bytes from 192.168.4.2: icmp_seq=50 ttl=61 time=0.057 ms


$ docker exec clab-frr-spine vtysh -c "show bgp ipv4"
BGP table version is 2, local router ID is 192.168.2.1, vrf id 0
Default local pref 100, local AS 64612
Status codes:  s suppressed, d damped, h history, u unsorted, * valid, > best, = multipath,
               i internal, r RIB-failure, S Stale, R Removed
Nexthop codes: @NNN nexthop's vrf id, < announce-nh-self
Origin codes:  i - IGP, e - EGP, ? - incomplete
RPKI validation codes: V valid, I invalid, N Not found

     Network          Next Hop            Metric LocPrf Weight Path
 *>  192.168.3.0/24   192.168.1.2              0             0 64510 i
 *>  192.168.4.0/24   192.168.2.2              0             0 64520 i

Displayed 2 routes and 2 total paths

 docker exec clab-frr-spine vtysh -c "show ip route"
Codes: K - kernel route, C - connected, L - local, S - static,
       R - RIP, O - OSPF, I - IS-IS, B - BGP, E - EIGRP, N - NHRP,
       T - Table, v - VNC, V - VNC-Direct, A - Babel, F - PBR,
       f - OpenFabric, t - Table-Direct,
       > - selected route, * - FIB route, q - queued, r - rejected, b - backup
       t - trapped, o - offload failure

C>* 192.168.1.0/24 is directly connected, toleafa, weight 1, 00:01:55
K * 192.168.1.0/24 [0/0] is directly connected, toleafa, weight 1, 00:01:55
L>* 192.168.1.1/32 is directly connected, toleafa, weight 1, 00:01:55
C>* 192.168.2.0/24 is directly connected, toleafb, weight 1, 00:01:55
K * 192.168.2.0/24 [0/0] is directly connected, toleafb, weight 1, 00:01:55
L>* 192.168.2.1/32 is directly connected, toleafb, weight 1, 00:01:55
B>* 192.168.3.0/24 [20/0] via 192.168.1.2, toleafa, weight 1, 00:01:53
B>* 192.168.4.0/24 [20/0] via 192.168.2.2, toleafb, weight 1, 00:01:53
```
