# FRR + Grout

Setup:

```
$ clab deploy
```

Verify:

```
$ docker exec clab-grout_frr-spine vtysh -c "show bgp summary" 


IPv4 Unicast Summary:
BGP router identifier 192.168.1.1, local AS number 64612 VRF default vrf-id 0
BGP table version 0
RIB entries 1, using 128 bytes of memory
Peers 1, using 24 KiB of memory

Neighbor        V         AS   MsgRcvd   MsgSent   TblVer  InQ OutQ  Up/Down State/PfxRcd   PfxSnt Desc
192.168.1.2     4      64510         4         3        0    0    0 00:00:26            1        0 N/A

Total number of neighbors 1

$  docker exec clab-grout_frr-spine vtysh -c "show bgp ipv4"    

BGP table version is 0, local router ID is 192.168.1.1, vrf id 0
Default local pref 100, local AS 64612
Status codes:  s suppressed, d damped, h history, u unsorted, * valid, > best, = multipath,
               i internal, r RIB-failure, S Stale, R Removed
Nexthop codes: @NNN nexthop's vrf id, < announce-nh-self
Origin codes:  i - IGP, e - EGP, ? - incomplete
RPKI validation codes: V valid, I invalid, N Not found

     Network          Next Hop            Metric LocPrf Weight Path
     192.168.3.0/24   192.168.1.2              0             0 64510 i

Displayed 1 routes and 1 total paths


```


## Debug

```

docker exec clab-grout_frr-leafA vtysh -c "show bgp neighbor" | grep state
docker exec clab-grout_frr-leafA  cat /etc/frr/frr.log

docker exec clab-grout_frr-spine vtysh -c "show bgp neighbor" | grep state
docker exec clab-grout_frr-spine-net-configure ip route

docker exec -it clab-grout_frr-spine-grout grcli --socket /shared/spine.grout.sock route show
docker exec -it clab-grout_frr-spine-grout grcli --socket /shared/spine.grout.sock nexthop
docker exec -it clab-grout_frr-spine-grout grcli --socket /shared/spine.grout.sock events

docker logs -t -f clab-grout_frr-spine-grout
docker logs -t -f clab-grout_frr-spine


docker logs  clab-grout_frr-host_a 

docker exec -it clab-grout_frr-spine cat /etc/frr/frr.log
docker exec clab-grout_frr-spine vtysh -c "show bgp ipv4" 
docker exec clab-grout_frr-spine vtysh -c "show bgp summary"
docker exec clab-grout_frr-spine vtysh -c "show ip route"

docker exec clab-grout_frr-leafA vtysh -c "show bgp ipv4" 

```





