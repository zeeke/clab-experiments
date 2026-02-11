# AGENTS.md

## Project Overview

A collection of network topology examples using [Containerlab](https://containerlab.dev/), progressing from simple point-to-point links to datacenter leaf-spine architectures with BGP routing and DPDK dataplanes.

## Repository Structure

```
linux-p2p/       # 2-node point-to-point (simplest example)
linux-3/         # 3-node triangle mesh
bridge/          # Linux bridge with 3 clients
frr/             # Leaf-spine with FRRouting BGP
clos01/          # Leaf-spine with Nokia SR Linux
grout-on-frr/    # Leaf-spine with FRR + GROUT DPDK dataplane (most advanced)
```

Each example contains a `*.clab.yml` topology file as its entry point. Some include FRR config files (`*.frr.conf`), draw.io diagrams, and shared config directories.

## Key Technologies

- **Containerlab** (`*.clab.yml`): defines topologies, node types, links, and startup commands
- **FRRouting (FRR)**: open-source BGP/OSPF routing suite, configured via `frr.conf` files and `frrcommon/daemons`
- **Nokia SR Linux**: commercial containerized NOS used in `clos01/`
- **GROUT**: DPDK-based dataplane in `grout-on-frr/`
- **Container images**: `ghcr.io/hellt/network-multitool` (hosts), `quay.io/frrouting/frr:10.2.1` (routing), `ghcr.io/nokia/srlinux` (SR Linux)

## Working with Topologies

```bash
# Deploy a topology
sudo containerlab deploy -t <dir>/<name>.clab.yml

# Destroy a topology
sudo containerlab destroy -t <dir>/<name>.clab.yml

# Inspect running labs
sudo containerlab inspect --all
```

Containerlab generates a `clab-<name>/` directory per deployment (gitignored) containing Ansible/Nornir inventories, TLS certs, and node configs.
