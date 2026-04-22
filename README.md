# magento2-infra-lab
High-performance Magento 2 stack optimization with Varnish Reverse Proxy, Redis for session/page cache, and Elasticsearch integration on AWS.

# Magento 2 High-Performance Infrastructure Lab

# Project Overview
This repository documents a professional-grade Magento 2.4 setup on AWS EC2 (Debian 12). The goal was to build a secure, fast, and scalable environment using industry-standard caching and web-serving tools.

# Tech Stack & Architecture
* Web Server: Nginx (Backend on Port 8080)
* Reverse Proxy: Varnish 6.0 (Frontend on Port 80 for Full Page Cache)
* PHP: 8.3-FPM
* Database: MySQL 8.0
* Search: Elasticsearch 7.10
* Cache/Session: Redis

# Performance Configurations
* Varnish Integration: Configured to handle incoming traffic and serve cached content instantly, reducing server load.
* Redis Caching: Implemented for both Session storage and Page Cache to offload database operations.
* Optimization: Used `bin/magento indexer:reindex` and `cache:flush` to ensure database integrity and speed (as seen in terminal logs).

# Security & Permissions
* Custom User: The entire stack runs under a dedicated `test-ssh` user and `clp` group.
* File Permissions: Strictly followed Magento best practices for folder ownership to avoid using insecure `777` permissions.

## Troubleshooting (Challenges Solved)
1. MySQL Error 1419: Resolved the binary logging privilege issue by enabling `log_bin_trust_function_creators`.
2. Port Binding: Successfully resolved the conflict between Varnish and Nginx by remapping Nginx to 8080.
3. Broken Pipe Errors: Managed remote session stability during long deployment processes. i have written this on readme.md file
