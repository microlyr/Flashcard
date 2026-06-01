# 📇 AI 智能闪卡

> 扔进一篇 Markdown 知识点笔记，AI 自动生成**挖空填空**、**问答题**、**选择题**三种闪卡，浏览器直接背诵。

## ✨ 功能

- 🤖 **AI 智能生成** — 原始笔记自动变成闪卡，支持通义千问 / Claude / GPT
- 🔤 **三种题型** — 挖空填空、问答题、4 选 1 选择题
- 📚 **多卡组管理** — 保存/切换/导入/导出卡组（JSON 格式）
- 📊 **薄弱点追踪** — 自动记录每次复习，标记顽固薄弱知识点
- 🔍 **增量扩展** — 对某张卡片点"扩展"，AI 围绕该知识点出更多题
- ⌨️ **键盘快捷键** — Space 翻转 / ←→ 切换 / K 会了 / F 不会
- 📱 **Android APK** — GitHub Actions 自动打包，手机安装即用

## 🚀 快速开始

### 网页版

1. 下载 [`flashcard.html`](flashcard.html)，用浏览器打开
2. 去 [阿里云百炼](https://bailian.console.aliyun.com/#/api-key) 免费创建 API Key
3. 在弹窗中填入 Key（支持通义千问 / Claude / GPT）
4. 拖入你的 `.md` 笔记文件，AI 自动生成闪卡

### Android APK

从 [Releases](../../releases) 下载最新 APK 安装即可。

## ⌨️ 快捷键

| 按键 | 操作 |
|------|------|
| `Space` | 翻转卡片 / 看答案 |
| `←` `→` | 上一张 / 下一张 |
| `K` | 标记"我会了" |
| `F` | 标记"没想起来" |

## 📝 知识点格式

直接扔原始笔记即可，AI 会自动理解并生成卡片。示例：

```markdown
# 你的主题

## 某个知识点
详细的内容描述、解释、例子...

## 另一个知识点
更多内容...
```

也支持显式的 Q&A 格式：`Q: 问题` / `A: 答案`

## 🛠 技术栈

- 纯前端单文件 HTML + CSS + Vanilla JS
- AI：通义千问 (Qwen) / Anthropic Claude / OpenAI GPT
- 存储：浏览器 localStorage
- APK：Android WebView + GitHub Actions 自动打包

## 📄 许可

MIT
