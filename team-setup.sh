#!/bin/bash

# Team Setup Script for Figma MCP
# Chạy script này để setup Figma MCP cho team member mới

echo "🎨 Figma MCP Team Setup"
echo "======================="

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check if running in project directory
if [ ! -f "package.json" ]; then
    echo -e "${YELLOW}⚠️  Không tìm thấy package.json"
    echo "Hãy chạy script này trong thư mục project${NC}"
    exit 1
fi

echo -e "${BLUE}📦 Installing dependencies...${NC}"
npm install

echo -e "${BLUE}🔧 Setting up Figma MCP...${NC}"

# Check if scripts exist
if [ ! -f "setup-figma-mcp-global.sh" ]; then
    echo -e "${YELLOW}⚠️  Không tìm thấy setup-figma-mcp-global.sh${NC}"
    exit 1
fi

if [ ! -f "figma-mcp-quick.sh" ]; then
    echo -e "${YELLOW}⚠️  Không tìm thấy figma-mcp-quick.sh${NC}"
    exit 1
fi

# Make scripts executable
chmod +x setup-figma-mcp-global.sh
chmod +x figma-mcp-quick.sh

# Run global setup
echo -e "${BLUE}🌍 Setting up global configuration...${NC}"
./setup-figma-mcp-global.sh

# Run project setup
echo -e "${BLUE}📁 Setting up project configuration...${NC}"
./figma-mcp-quick.sh

echo -e "\n${GREEN}✅ Setup completed successfully!${NC}"
echo -e "\n${BLUE}📝 Next steps:${NC}"
echo "1. Restart Cursor"
echo "2. Open a Figma file"
echo "3. Create channel in Figma and use: @figma join-channel YOUR_CHANNEL_NAME"
echo "4. Try: @figma get-document-info"

echo -e "\n${BLUE}📚 Available commands:${NC}"
echo "npm run figma:init        # Setup everything" 
echo "npm run figma:setup       # Setup current project"
echo "npm run figma:test        # Test connection"

echo -e "\n${YELLOW}💡 Tip: If you have issues, try restarting Cursor first!${NC}" 