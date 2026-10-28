# centresystems.info

Personal site, self-hosted on a Proxmox VM behind a Cloudflare Tunnel.

## Features
- Live status of my Proxmox nodes and game servers from Zabbix
- Live packet view fed by flowView, an XDP/eBPF flow classifier on my LAN
- Projects pulled from GitHub, with a file browser, syntax highlighting, and rendered READMEs
- Resume viewer with a PDF download

## Technologies
- Caddy
- JavaScript, HTML, CSS
- Node.js
- Zabbix API, GitHub API
- marked, DOMPurify, highlight.js

## Deploy
Merges to `main` run CI (shellcheck, JS syntax, Caddyfile validation), then a self-hosted runner on the VM runs `deploy.sh`.