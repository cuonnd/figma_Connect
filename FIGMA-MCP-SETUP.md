# Figma MCP Setup Guide - Máy Mới

## 🎯 Tổng Quan

Script này giải quyết vấn đề: **Chạy trong project nhưng setup global** - có thể sử dụng Figma MCP từ mọi thư mục sau khi setup 1 lần.

## 📋 Các Bước Setup Cho Máy Mới

### 1. Tạo Script Global Setup

```bash
# Tạo script setup
cat > ~/.figma-mcp.sh << 'EOF'
#!/bin/bash

# Figma MCP Global Setup Script
# Usage: ~/.figma-mcp.sh [COMMAND] [CHANNEL]

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

FIGMA_TOKEN="YOUR_FIGMA_ACCESS_TOKEN_HERE"

setup() {
    local channel=${1:-"7eixb093"}
    echo -e "${BLUE}🔧 Setup environment...${NC}"
    
    mkdir -p ~/.cursor
    
    echo "FIGMA_ACCESS_TOKEN=${FIGMA_TOKEN}" > ~/.figma-mcp-env
    echo "FIGMA_CHANNEL=${channel}" >> ~/.figma-mcp-env
    
    echo '{"mcpServers":{"figma":{"command":"npx","args":["@sethdouglasford/mcp-figma@latest"],"env":{"FIGMA_ACCESS_TOKEN":"'${FIGMA_TOKEN}'","FIGMA_CHANNEL":"'${channel}'"}}}}' > ~/.cursor/mcp.json
    
    echo -e "${GREEN}✅ Environment setup completed${NC}"
    echo -e "${YELLOW}Channel: ${channel}${NC}"
}

start() {
    echo -e "${BLUE}🚀 Installing package...${NC}"
    npm install -g @sethdouglasford/mcp-figma@latest
    echo -e "${GREEN}✅ Installation completed${NC}"
}

test() {
    echo -e "${BLUE}🧪 Testing connection...${NC}"
    
    if [ -f ~/.figma-mcp-env ]; then
        source ~/.figma-mcp-env
        echo -e "${GREEN}✅ Environment loaded${NC}"
        echo "Token: ${FIGMA_ACCESS_TOKEN:0:10}..."
        echo "Channel: ${FIGMA_CHANNEL}"
    else
        echo -e "${RED}❌ Environment file missing${NC}"
    fi
    
    if [ -f ~/.cursor/mcp.json ]; then
        echo -e "${GREEN}✅ MCP config: OK${NC}"
    else
        echo -e "${RED}❌ MCP config: Missing${NC}"
    fi
    
    if npm list -g @sethdouglasford/mcp-figma > /dev/null 2>&1; then
        echo -e "${GREEN}✅ Package: Installed${NC}"
    else
        echo -e "${RED}❌ Package: Not found${NC}"
    fi
    
    echo -e "${GREEN}✅ Test completed${NC}"
}

clean() {
    echo -e "${BLUE}🧹 Cleaning global setup...${NC}"
    rm -f ~/.figma-mcp-env
    rm -f ~/.cursor/mcp.json
    npm uninstall -g @sethdouglasford/mcp-figma
    echo -e "${GREEN}🎉 Global setup cleaned${NC}"
}

all() {
    local channel=${1:-"7eixb093"}
    echo -e "${BLUE}🚀 Complete setup...${NC}"
    setup "$channel"
    start
    test
    echo -e "${GREEN}🎉 Complete setup finished!${NC}"
}

case "$1" in
    "setup"|"env")
        setup "$2"
        ;;
    "start"|"install")
        start
        ;;
    "test")
        test
        ;;
    "clean"|"remove"|"uninstall")
        clean
        ;;
    "all")
        all "$2"
        ;;
    *)
        echo -e "${BLUE}🔗 Figma MCP Commands${NC}"
        echo ""
        echo -e "${YELLOW}Usage:${NC}"
        echo "  $0 setup [CHANNEL]    # Setup environment (auto global)"
        echo "  $0 start              # Install package (auto global)"
        echo "  $0 test               # Test connection"
        echo "  $0 clean              # Remove global setup"
        echo "  $0 all [CHANNEL]      # Complete setup"
        echo ""
        echo -e "${BLUE}Examples:${NC}"
        echo "  $0 setup 7eixb093     # Setup with channel"
        echo "  $0 start              # Install package"
        echo "  $0 test               # Test everything"
        echo "  $0 clean              # Remove all global files"
        echo "  $0 all 7eixb093       # Complete setup"
        echo ""
        echo -e "${GREEN}✨ Features:${NC}"
        echo "  - Auto global setup"
        echo "  - Works from any directory"
        echo "  - Easy cleanup"
        echo "  - Simple 4 commands"
        ;;
esac
EOF

# Cấp quyền thực thi
chmod +x ~/.figma-mcp.sh
```

### 2. Setup Hoàn Chỉnh

```bash
# Chạy setup hoàn chỉnh (setup + install + test)
~/.figma-mcp.sh all 7eixb093
```

### 3. Hoặc Setup Từng Bước

```bash
# Bước 1: Setup environment (tự động global)
~/.figma-mcp.sh setup 7eixb093

# Bước 2: Install package (tự động global)
~/.figma-mcp.sh start

# Bước 3: Test connection
~/.figma-mcp.sh test
```

## 🎯 Cách Script Giải Quyết Vấn Đề

### ❌ Trước Đây:
- Chạy trong project → chỉ hoạt động trong project đó
- Phải setup lại cho từng project
- Không có global setup

### ✅ Bây Giờ:
- **Chạy trong project** → **Tự động setup global**
- **Hoạt động từ mọi thư mục**
- **Chỉ cần setup 1 lần**

## 📁 Files Được Tạo

### Global Environment
- `~/.figma-mcp-env` - Environment variables
- `~/.cursor/mcp.json` - Global MCP configuration

### Script
- `~/.figma-mcp.sh` - Setup script với 4 lệnh chính

## 🚀 Các Lệnh Chính

### 1. `setup [CHANNEL]`
- Tạo environment file global
- Tạo MCP config global
- Hoạt động từ mọi thư mục

### 2. `start`
- Cài đặt package globally
- Package có sẵn từ mọi nơi

### 3. `test`
- Test từ bất kỳ thư mục nào
- Xác nhận global setup hoạt động

### 4. `clean`
- Xóa tất cả global files
- Uninstall global package

### 5. `all [CHANNEL]`
- Chạy setup + start + test
- Setup hoàn chỉnh 1 lệnh

## 🧪 Test Từ Các Thư Mục Khác

```bash
# Test từ project khác
cd ~/Desktop/new-project
~/.figma-mcp.sh test  # Vẫn hoạt động!

# Test từ thư mục khác
cd /tmp
~/.figma-mcp.sh test  # Vẫn hoạt động!

# Test từ bất kỳ đâu
cd ~/Documents
~/.figma-mcp.sh test  # Vẫn hoạt động!
```

## 🔧 Thay Đổi Channel

```bash
# Thay đổi channel global
~/.figma-mcp.sh setup NEW_CHANNEL_ID

# Hoặc setup lại hoàn chỉnh
~/.figma-mcp.sh all NEW_CHANNEL_ID
```

## 🧹 Xóa Global Setup

```bash
# Xóa tất cả global setup
~/.figma-mcp.sh clean
```

## 📋 Checklist Máy Mới

- [ ] Tạo script `~/.figma-mcp.sh`
- [ ] Cấp quyền thực thi `chmod +x ~/.figma-mcp.sh`
- [ ] Chạy setup hoàn chỉnh `~/.figma-mcp.sh all 7eixb093`
- [ ] Test từ thư mục khác `cd /tmp && ~/.figma-mcp.sh test`
- [ ] Restart Cursor
- [ ] Test trong Cursor với `@figma get-document-info`

## 🎉 Kết Quả

**✅ Chạy script trong project** → **Tự động setup global**
**✅ Global config** → **Hoạt động từ mọi thư mục**
**✅ Chỉ setup 1 lần** → **Dùng được ở mọi nơi**
**✅ Dễ dàng xóa** → **Lệnh `clean` để xóa global**

Script đã hoàn toàn giải quyết được vấn đề: **chạy trong project nhưng setup global!** 🎯 