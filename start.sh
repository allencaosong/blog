#!/bin/bash

# 获取本机IP地址
get_local_ip() {
  hostname -I | awk '{print $1}'
}

# 替换Docker Compose文件中的--baseURL参数为本机IP
replace_baseURL() {
  local_ip=$(get_local_ip)
  sed -i "s|--baseURL=http://.*$|--baseURL=http://${local_ip}|" docker-compose.yml
}

# 启动Hugo服务
start_hugo() {
  replace_baseURL
  docker-compose up -d
}

# 主菜单
main_menu() {
  echo "=== Hugo Docker Wrapper - Start ==="
  start_hugo
}

# 运行主菜单
main_menu
