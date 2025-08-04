# 🎨 Figma MCP Setup Guide

Hướng dẫn setup Figma MCP cho tất cả projects một cách đơn giản nhất.

## 🚀 Setup Global (Chỉ làm 1 lần)

### Cách 1: Setup toàn bộ hệ thống
```bash
chmod +x setup-figma-mcp-global.sh
./setup-figma-mcp-global.sh
```

### Cách 2: Setup thủ công
```bash
# 1. Tạo global config
mkdir -p ~/.cursor
cat > ~/.cursor/mcp.json << EOF
{
  "mcpServers": {
    "figma": {
      "command": "npx",
      "args": ["@sethdouglasford/mcp-figma@latest"],
      "env": {
        "FIGMA_ACCESS_TOKEN": "YOUR_FIGMA_TOKEN_HERE"
      }
    }
  }
}
EOF

# 2. Cài đặt global package
npm install -g @sethdouglasford/mcp-figma@latest
```

## 🔗 Setup cho Project Mới

### Cách 1: Sử dụng script nhanh
```bash
# Copy script vào project
cp figma-mcp-quick.sh your-new-project/
cd your-new-project
chmod +x figma-mcp-quick.sh
./figma-mcp-quick.sh
```

### Cách 2: Setup thủ công
```bash
# 1. Tạo mcp-config.json
cat > mcp-config.json << EOF
{
  "mcpServers": {
    "figma": {
      "command": "npx",
      "args": ["@sethdouglasford/mcp-figma@latest"],
      "env": {
        "FIGMA_ACCESS_TOKEN": "YOUR_FIGMA_TOKEN_HERE"
      }
    }
  }
}
EOF

# 2. Tạo .env
echo "FIGMA_ACCESS_TOKEN=YOUR_FIGMA_TOKEN_HERE" > .env

# 3. Cài đặt dependencies
npm install @sethdouglasford/mcp-figma@latest dotenv
```

## 🔧 Setup cho Project Hiện Tại

### Cách 1: Sử dụng alias (sau khi setup global)
```bash
figma-setup
```

### Cách 2: Copy template
```bash
# Copy từ global templates
cp ~/.figma-mcp-templates/mcp-config.json .
echo "FIGMA_ACCESS_TOKEN=YOUR_FIGMA_TOKEN_HERE" > .env
npm install @sethdouglasford/mcp-figma@latest dotenv
```

## 🎯 Sử dụng

### 1. Restart Cursor
Sau khi setup, restart Cursor để load MCP configuration.

### 2. Join channel
```bash
@figma join-channel cs3tqr8e
```

### 3. Sử dụng commands
- `@figma get-document-info` - Lấy thông tin document
- `@figma get-selection` - Lấy selection hiện tại
- `@figma read-my-design` - Đọc design chi tiết
- `@figma create-rectangle` - Tạo rectangle
- `@figma create-frame` - Tạo frame
- `@figma create-text` - Tạo text

## 📁 Cấu trúc Files

```
project/
├── mcp-config.json          # MCP configuration
├── .env                     # Environment variables
├── package.json             # Dependencies
└── figma-mcp-quick.sh      # Quick setup script
```

## 🔍 Troubleshooting

### Lỗi "MCP server not found"
```bash
# Kiểm tra cấu hình
cat ~/.cursor/mcp.json

# Reinstall package
npm install -g @sethdouglasford/mcp-figma@latest
```

### Lỗi "Invalid access token"
```bash
# Kiểm tra token
echo $FIGMA_ACCESS_TOKEN

# Cập nhật token trong .env
echo "FIGMA_ACCESS_TOKEN=your_new_token" > .env
```

### Lỗi "Connection timeout"
```bash
# Restart Cursor
# Kiểm tra kết nối internet
# Đảm bảo Figma file đang mở
```

## 🎨 Ví dụ Sử dụng

### Convert Figma design to React component
```typescript
// 1. Lấy design info
const designInfo = await figma.getDocumentInfo();

// 2. Lấy selection
const selection = await figma.getSelection();

// 3. Đọc design chi tiết
const designDetails = await figma.readMyDesign();

// 4. Tạo React component
const component = `
import React from 'react';

export const ${designInfo.name}Component = () => {
  return (
    <div style={{
      width: '${designDetails.width}px',
      height: '${designDetails.height}px',
      backgroundColor: '${designDetails.backgroundColor}'
    }}>
      ${designDetails.text || ''}
    </div>
  );
};
`;
```

## 📚 Resources

- [Figma MCP Server](https://npm.im/@sethdouglasford/mcp-figma)
- [MCP Documentation](https://modelcontextprotocol.io/)
- [Figma API](https://www.figma.com/developers/api)

## 🆘 Hỗ trợ

Nếu gặp vấn đề:
1. Kiểm tra logs trong Cursor DevTools
2. Restart Cursor
3. Kiểm tra token Figma
4. Đảm bảo Figma file đang mở 