#!/bin/bash

echo "正在清除缓存和生成文件..."

# 清除所有可能缓存
hexo clean
rm -rf public
rm -rf .cache
rm -rf db.json
rm -rf themes/butterfly/.sass-cache
find . -type d -name "__pycache__" -exec rm -rf {} +
find . -name "*.un~" -delete
find . -name "*.tdesktop-theme" -delete

echo "部署到GitHub服务器ing..."
hexo g --debug
gulp
hexo d
hexo s
