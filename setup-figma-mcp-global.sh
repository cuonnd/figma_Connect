#!/bin/bash

# Figma MCP Global Setup Script
# Tự động setup Figma MCP cho tất cả projects

echo "🚀 Setting up Figma MCP globally..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Figma token (có thể thay đổi)
FIGMA_TOKEN="YOUR_FIGMA_TOKEN_HERE"

# 1. Setup global Cursor MCP configuration
echo -e "${BLUE}📝 Setting up global Cursor MCP configuration...${NC}"

# Tạo thư mục nếu chưa có
mkdir -p ~/.cursor

# Tạo global MCP config
cat > ~/.cursor/mcp.json << EOF
{
  "mcpServers": {
    "figma": {
      "command": "npx",
      "args": ["@sethdouglasford/mcp-figma@latest"],
      "env": {
        "FIGMA_ACCESS_TOKEN": "${FIGMA_TOKEN}"
      }
    }
  }
}
EOF

echo -e "${GREEN}✅ Global MCP config created at ~/.cursor/mcp.json${NC}"

# 2. Setup global npm package
echo -e "${BLUE}📦 Installing global Figma MCP package...${NC}"
npm install -g @sethdouglasford/mcp-figma@latest

# 3. Tạo global environment file
echo -e "${BLUE}🔧 Creating global environment file...${NC}"
cat > ~/.figma-mcp-env << EOF
# Figma MCP Global Configuration
FIGMA_ACCESS_TOKEN=${FIGMA_TOKEN}
FIGMA_CHANNEL=YOUR_CHANNEL_NAME_HERE
FIGMA_MCP_SERVER=@sethdouglasford/mcp-figma@latest
EOF

echo -e "${GREEN}✅ Global environment file created at ~/.figma-mcp-env${NC}"

# 4. Tạo project template
echo -e "${BLUE}📋 Creating project template...${NC}"
mkdir -p ~/.figma-mcp-templates

cat > ~/.figma-mcp-templates/mcp-config.json << EOF
{
  "mcpServers": {
    "figma": {
      "command": "npx",
      "args": ["@sethdouglasford/mcp-figma@latest"],
      "env": {
        "FIGMA_ACCESS_TOKEN": "\${FIGMA_ACCESS_TOKEN}"
      }
    }
  }
}
EOF

cat > ~/.figma-mcp-templates/package.json << EOF
{
  "name": "project-name",
  "version": "1.0.0",
  "description": "Project with Figma MCP integration",
  "scripts": {
    "figma:setup": "cp ~/.figma-mcp-templates/mcp-config.json . && echo 'FIGMA_ACCESS_TOKEN=${FIGMA_TOKEN}' > .env && echo 'FIGMA_CHANNEL=YOUR_CHANNEL_NAME_HERE' >> .env",
    "figma:test": "npx @sethdouglasford/mcp-figma@latest --help",
    "figma:join": "npx @sethdouglasford/mcp-figma@latest --join-channel \${FIGMA_CHANNEL}"
  },
  "dependencies": {
    "@sethdouglasford/mcp-figma": "latest",
    "dotenv": "^17.2.1"
  }
}
EOF

echo -e "${GREEN}✅ Project templates created at ~/.figma-mcp-templates${NC}"

# 5. Tạo quick setup script cho projects mới
cat > ~/.figma-mcp-templates/quick-setup.sh << 'EOF'
#!/bin/bash

# Quick Figma MCP Setup for new projects
echo "🔗 Quick Figma MCP Setup..."

# Copy template files
cp ~/.figma-mcp-templates/mcp-config.json .
cp ~/.figma-mcp-templates/package.json .

# Load global environment
source ~/.figma-mcp-env

# Update package.json with project name
PROJECT_NAME=$(basename $(pwd))
sed -i '' "s/project-name/$PROJECT_NAME/g" package.json

# Create .env file
cat > .env << EOF
FIGMA_ACCESS_TOKEN=$FIGMA_ACCESS_TOKEN
FIGMA_CHANNEL=YOUR_CHANNEL_NAME_HERE
EOF

# Install dependencies
npm install

echo "✅ Figma MCP setup completed for $PROJECT_NAME"
echo "📝 Next: Restart Cursor and use @figma commands"
EOF

chmod +x ~/.figma-mcp-templates/quick-setup.sh

echo -e "${GREEN}✅ Quick setup script created${NC}"

# 6. Tạo alias cho terminal
echo -e "${BLUE}🔗 Creating terminal aliases...${NC}"

# Thêm aliases vào shell config
SHELL_CONFIG=""
if [[ "$SHELL" == *"zsh"* ]]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [[ "$SHELL" == *"bash"* ]]; then
    SHELL_CONFIG="$HOME/.bashrc"
fi

if [ -n "$SHELL_CONFIG" ]; then
    cat >> "$SHELL_CONFIG" << EOF

# Figma MCP Aliases
alias figma-setup='~/.figma-mcp-templates/quick-setup.sh'
alias figma-test='npx @sethdouglasford/mcp-figma@latest --help'
alias figma-token='echo "Current token: \$FIGMA_ACCESS_TOKEN"'
EOF
    echo -e "${GREEN}✅ Aliases added to $SHELL_CONFIG${NC}"
    echo -e "${YELLOW}💡 Run 'source $SHELL_CONFIG' to reload aliases${NC}"
fi

# 7. Tạo VS Code/Cursor extension recommendations
mkdir -p ~/.figma-mcp-templates/.vscode
cat > ~/.figma-mcp-templates/.vscode/extensions.json << EOF
{
  "recommendations": [
    "cursor.cursor",
    "figma.figma-vscode-extension"
  ]
}
EOF

echo -e "${GREEN}✅ VS Code extensions recommendations created${NC}"

# 8. Summary
echo -e "\n${GREEN}🎉 Figma MCP Global Setup Completed!${NC}"
echo -e "\n${BLUE}📋 What was set up:${NC}"
echo -e "  ✅ Global Cursor MCP config (~/.cursor/mcp.json)"
echo -e "  ✅ Global npm package (@sethdouglasford/mcp-figma)"
echo -e "  ✅ Global environment file (~/.figma-mcp-env)"
echo -e "  ✅ Project templates (~/.figma-mcp-templates/)"
echo -e "  ✅ Quick setup script"
echo -e "  ✅ Terminal aliases"

echo -e "\n${BLUE}🚀 How to use in new projects:${NC}"
echo -e "  1. cd your-new-project"
echo -e "  2. Run: figma-setup"
echo -e "  3. Restart Cursor"
echo -e "  4. Use @figma commands"

echo -e "\n${BLUE}🔧 Manual setup for existing projects:${NC}"
echo -e "  1. Copy ~/.figma-mcp-templates/mcp-config.json to project root"
echo -e "  2. Add 'FIGMA_ACCESS_TOKEN=${FIGMA_TOKEN}' to .env"
echo -e "  3. npm install @sethdouglasford/mcp-figma@latest"

echo -e "\n${YELLOW}⚠️  Remember to restart Cursor after setup!${NC}" 