#!/usr/bin/env node

require('dotenv').config();

console.log('🔗 Auto-joining Figma channel...');

const FIGMA_CHANNEL = process.env.FIGMA_CHANNEL;

if (!FIGMA_CHANNEL) {
  console.log('❌ FIGMA_CHANNEL not found in .env file');
  console.log('📝 Please add FIGMA_CHANNEL=your_channel_name to .env file');
  process.exit(1);
}

if (FIGMA_CHANNEL === 'YOUR_CHANNEL_NAME_HERE') {
  console.log('❌ Please replace YOUR_CHANNEL_NAME_HERE with your actual channel name');
  console.log('📝 Edit .env file and change FIGMA_CHANNEL=your_actual_channel_name');
  process.exit(1);
}

console.log(`✅ Joining channel: ${FIGMA_CHANNEL}`);

// Simulate joining channel
console.log('\n📋 Next steps:');
console.log('1. Restart Cursor');
console.log('2. Open a Figma file');
console.log(`3. Use: @figma join-channel ${FIGMA_CHANNEL}`);
console.log('4. Or use: @figma get-document-info');

console.log('\n🎯 Available commands:');
console.log('npm run figma:join    # Join channel from .env');
console.log('npm run figma:test    # Test connection');
console.log('npm run figma:setup   # Setup project'); 