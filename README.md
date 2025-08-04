# 🎨 Figma MCP Setup for Team

Setup Figma MCP cho team một cách đơn giản nhất.

## 🚀 Quick Setup (3 bước)

### Bước 1: Clone và cài đặt
```bash
git clone <your-repo-url>
cd sampleapp
npm install
```

### Bước 2: Setup Figma MCP
```bash
# Cách 1: Sử dụng npm script (khuyến nghị)
npm run figma:init

# Cách 2: Sử dụng team setup script
npm run team:setup

# Cách 3: Chạy trực tiếp
chmod +x team-setup.sh && ./team-setup.sh
```

### Bước 3: Restart Cursor và sử dụng
1. Restart Cursor
2. Mở Figma file
3. Sử dụng: `@figma join-channel cs3tqr8e`

## 📋 Các lệnh có sẵn

```bash
npm run figma:init        # Setup toàn bộ (global + project)
npm run figma:setup       # Setup cho project hiện tại
npm run figma:setup-global # Setup global cho máy
npm run figma:test        # Test kết nối
npm run team:setup        # Setup cho team member mới
```

## 🎯 Sử dụng

Sau khi setup, bạn có thể sử dụng các commands:

- `@figma join-channel cs3tqr8e` - Join channel
- `@figma get-document-info` - Lấy thông tin document
- `@figma get-selection` - Lấy selection hiện tại
- `@figma read-my-design` - Đọc design chi tiết

## 🔧 Troubleshooting

### Lỗi "MCP server not found"
```bash
npm run figma:setup-global
# Sau đó restart Cursor
```

### Lỗi "Invalid token"
Kiểm tra file `.env` có chứa token đúng không:
```bash
cat .env
```

### Lỗi "Connection timeout"
- Restart Cursor
- Đảm bảo Figma file đang mở
- Kiểm tra kết nối internet

## 📁 Files quan trọng

- `setup-figma-mcp-global.sh` - Script setup global
- `figma-mcp-quick.sh` - Script setup nhanh
- `FIGMA-MCP-GUIDE.md` - Hướng dẫn chi tiết
- `mcp-config.json` - Cấu hình MCP
- `.env` - Environment variables

## 🆘 Hỗ trợ

Nếu gặp vấn đề:
1. Chạy `npm run figma:test`
2. Kiểm tra logs trong Cursor DevTools
3. Restart Cursor
4. Đảm bảo Figma file đang mở 