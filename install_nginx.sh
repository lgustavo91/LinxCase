#!/bin/bash
'sudo usermod -aG sudo adminuser && sudo apt-get update && sudo apt-get install -y nginx && sudo systemctl enable nginx && sudo systemctl start nginx'
