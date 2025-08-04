#!/bin/bash

# Quick Figma MCP Setup for current project
echo "🔗 Quick Figma MCP Setup..."

# Figma token
FIGMA_TOKEN="YOUR_FIGMA_TOKEN_HERE"

# 1. Create mcp-config.json
cat > mcp-config.json << EOF
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

# 2. Create .env file
echo "FIGMA_ACCESS_TOKEN=${FIGMA_TOKEN}" > .env

# 3. Update package.json if exists, create if not
if [ -f "package.json" ]; then
    echo "📦 Updating existing package.json..."
    # Add dependencies if not exists
    if ! grep -q "@sethdouglasford/mcp-figma" package.json; then
        npm install @sethdouglasford/mcp-figma@latest dotenv
    fi
else
    echo "📦 Creating new package.json..."
    cat > package.json << EOF
{
  "name": "$(basename $(pwd))",
  "version": "1.0.0",
  "description": "Project with Figma MCP integration",
  "scripts": {
    "figma:test": "npx @sethdouglasford/mcp-figma@latest --help"
  },
  "dependencies": {
    "@sethdouglasford/mcp-figma": "latest",
    "dotenv": "^17.2.1"
  }
}
EOF
    npm install
fi

# 4. Copy to Cursor global config
cp mcp-config.json ~/.cursor/mcp.json

echo "✅ Figma MCP setup completed!"
echo "📝 Next steps:"
echo "  1. Restart Cursor"
echo "  2. Use @figma commands"
echo "  3. Join channel: @figma join-channel cs3tqr8e" 