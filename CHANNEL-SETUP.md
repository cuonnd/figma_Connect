# 📡 Figma Channel Setup Guide

## 🎯 Tạo Channel trong Figma

### Bước 1: Mở Figma file
1. Đăng nhập [Figma](https://www.figma.com)
2. Mở file design mà bạn muốn kết nối

### Bước 2: Cài đặt Talk to Figma Plugin
1. Vào menu **Plugins** → **Browse plugins in Community**
2. Tìm kiếm "Talk to Figma"
3. Click **Install**

### Bước 3: Tạo Channel
1. Vào menu **Plugins** → **Talk to Figma**
2. Click **Create Channel** hoặc **Join Channel**
3. Đặt tên channel (ví dụ: `my-design-channel`)
4. Copy channel name

### Bước 4: Sử dụng trong Cursor
```bash
# Thay thế YOUR_CHANNEL_NAME bằng channel name thật
@figma join-channel YOUR_CHANNEL_NAME
```

## 🔄 Các loại Channel

### 1. **Private Channel** (Khuyến nghị)
- Chỉ bạn có thể truy cập
- An toàn cho project cá nhân
- Tạo bằng: **Create Channel**

### 2. **Shared Channel**
- Chia sẻ với team
- Nhiều người có thể join
- Tạo bằng: **Create Shared Channel**

### 3. **Join Existing Channel**
- Join channel đã có sẵn
- Cần được mời hoặc có link
- Sử dụng: **Join Channel**

## 📝 Ví dụ Channel Names

```
my-project-channel
design-system-2024
ui-components
landing-page-design
mobile-app-design
```

## 🚀 Workflow hoàn chỉnh

### 1. Setup Figma MCP
```bash
npm run figma:init
```

### 2. Tạo Channel trong Figma
- Mở Figma file
- Vào Plugins → Talk to Figma
- Tạo channel mới

### 3. Join Channel trong Cursor
```bash
@figma join-channel my-project-channel
```

### 4. Sử dụng Commands
```bash
@figma get-document-info
@figma get-selection
@figma read-my-design
```

## 🔧 Troubleshooting

### Lỗi "Channel not found"
- Kiểm tra tên channel có đúng không
- Đảm bảo đã tạo channel trong Figma
- Thử tạo channel mới

### Lỗi "Permission denied"
- Kiểm tra quyền truy cập Figma file
- Đảm bảo đã cài đặt Talk to Figma plugin
- Thử restart Figma

### Lỗi "Connection timeout"
- Kiểm tra kết nối internet
- Đảm bảo Figma file đang mở
- Thử join lại channel

## 💡 Tips

1. **Đặt tên channel có ý nghĩa** để dễ nhớ
2. **Sử dụng private channel** cho project cá nhân
3. **Share channel** với team khi cần collaboration
4. **Backup channel name** để không bị mất
5. **Test connection** trước khi làm việc

## 📚 Resources

- [Talk to Figma Plugin](https://www.figma.com/community/plugin/1234567890/talk-to-figma)
- [Figma Plugin Documentation](https://www.figma.com/plugin-docs/)
- [MCP Documentation](https://modelcontextprotocol.io/) 