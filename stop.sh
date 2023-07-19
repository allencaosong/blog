#!/bin/bash

# 停止Hugo服务
stop_hugo() {
  docker-compose down
}

# 主菜单
main_menu() {
  echo "=== Hugo Docker Wrapper - Stop ==="
  stop_hugo
}

# 运行主菜单
main_menu
