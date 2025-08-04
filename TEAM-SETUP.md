# 🎨 Figma MCP Team Setup Guide

## 🚀 Quick Start (3 bước)

### Bước 1: Clone repo
```bash
git clone https://github.com/cuonnd/figma_Connect.git
cd figma_Connect
```

### Bước 2: Setup Figma MCP
```bash
# Cài đặt dependencies
npm install

# Setup Figma MCP (chọn 1 trong 3 cách)
npm run figma:init        # Khuyến nghị
# HOẶC
npm run team:setup
# HOẶC
chmod +x team-setup.sh && ./team-setup.sh
```

### Bước 3: Cấu hình token và channel
```bash
# Tạo file .env với token và channel của bạn
cat > .env << EOF
FIGMA_ACCESS_TOKEN=YOUR_ACTUAL_TOKEN
FIGMA_CHANNEL=YOUR_CHANNEL_NAME
EOF
```

### Bước 4: Restart Cursor và sử dụng
1. Restart Cursor
2. Mở Figma file
3. Sử dụng: `@figma join-channel YOUR_CHANNEL_NAME`
4. Hoặc chạy: `npm run figma:auto-join`

## 🔑 Lấy Figma Token

1. Đăng nhập [Figma](https://www.figma.com)
2. Vào **Settings** → **Account** → **Personal access tokens**
3. Click **Create new token**
4. Copy token và thêm vào file `.env`

## 📋 Các lệnh có sẵn

```bash
npm run figma:init        # Setup toàn bộ
npm run figma:setup       # Setup project hiện tại
npm run figma:setup-global # Setup global
npm run figma:test        # Test kết nối
npm run figma:auto-join   # Auto join channel từ .env
npm run team:setup        # Setup cho team member mới
```

## 🎯 Sử dụng

Sau khi setup, bạn có thể sử dụng:

- `@figma join-channel YOUR_CHANNEL_NAME` - Join channel của bạn
- `@figma get-document-info` - Lấy thông tin document
- `@figma get-selection` - Lấy selection hiện tại
- `@figma read-my-design` - Đọc design chi tiết

### 📝 Cách tạo channel trong Figma:
1. Mở Figma file
2. Vào menu **Plugins** → **Talk to Figma**
3. Tạo channel mới hoặc join channel có sẵn
4. Copy channel name và sử dụng trong Cursor

## 🔧 Troubleshooting

### Lỗi "MCP server not found"
```bash
npm run figma:setup-global
# Sau đó restart Cursor
```

### Lỗi "Invalid token"
Kiểm tra file `.env`:
```bash
cat .env
```

### Lỗi "Connection timeout"
- Restart Cursor
- Đảm bảo Figma file đang mở
- Kiểm tra kết nối internet

## 📁 Files quan trọng

- `team-setup.sh` - Script setup tự động
- `setup-figma-mcp-global.sh` - Script setup global
- `figma-mcp-quick.sh` - Script setup nhanh
- `FIGMA-MCP-GUIDE.md` - Hướng dẫn chi tiết
- `mcp-config.json` - Cấu hình MCP mẫu
- `.env` - Environment variables (tạo thủ công)

## 🆘 Hỗ trợ

Nếu gặp vấn đề:
1. Chạy `npm run figma:test`
2. Kiểm tra logs trong Cursor DevTools
3. Restart Cursor
4. Đảm bảo Figma file đang mở

---

**Lưu ý:** Đừng quên thay thế `YOUR_ACTUAL_TOKEN` bằng token Figma thật của bạn! 