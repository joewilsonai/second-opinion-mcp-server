<div align="center">

# 🧠 Second Opinion MCP Server

**Stuck on a problem? Get a second opinion from a different model.**

An MCP server that combines **Gemini**, **Perplexity**, and **Stack Overflow** to give Claude (or any MCP client) a multi-source second take on tough coding problems.

[![MCP](https://img.shields.io/badge/MCP-Server-d97757)](https://modelcontextprotocol.io)
[![Stars](https://img.shields.io/github/stars/joewilsonai/second-opinion-mcp-server?style=social)](https://github.com/joewilsonai/second-opinion-mcp-server/stargazers)
[![Node](https://img.shields.io/badge/Node-18+-339933?logo=node.js)](https://nodejs.org)
[![License](https://img.shields.io/badge/License-MIT-blue)](#license)

</div>

---

## Why

When Claude gets stuck — or just confidently wrong — the fastest unblocker is a different model with different training. This server makes that one tool call away:

- 🟦 **Google Gemini** for an alternative model perspective
- 🟪 **Perplexity** for fresh web-grounded analysis
- 🟧 **Stack Overflow** for accepted answers from real engineers

You stay in your Claude conversation. The second opinion comes to you.

## Features

- 🌐 **Multi-source synthesis** — combines insights from three different sources into one answer
- 🔤 **Automatic language detection** from file extensions
- 📋 **Code snippet extraction** and clean formatting
- 📄 **Markdown report generation** for solutions
- 🧠 **Git-aware context gathering** — includes nearby files when relevant
- ⚡ **Single tool call** — no need to context-switch between chat apps

## Install

```bash
git clone https://github.com/joewilsonai/second-opinion-mcp-server
cd second-opinion-mcp-server
npm install
npm run build
```

## Configure in Claude Desktop

Edit your `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "second-opinion": {
      "command": "node",
      "args": ["/absolute/path/to/second-opinion-mcp-server/build/index.js"],
      "env": {
        "GEMINI_API_KEY": "your-gemini-api-key",
        "PERPLEXITY_API_KEY": "your-perplexity-api-key",
        "STACK_EXCHANGE_KEY": "your-stack-exchange-key"
      }
    }
  }
}
```

Restart Claude Desktop.

### Required environment variables

| Variable | Source | Notes |
|---|---|---|
| `GEMINI_API_KEY` | [aistudio.google.com](https://aistudio.google.com) | Required |
| `PERPLEXITY_API_KEY` | [perplexity.ai/settings/api](https://perplexity.ai/settings/api) | Required |
| `STACK_EXCHANGE_KEY` | [stackapps.com/apps/oauth/register](https://stackapps.com/apps/oauth/register) | Optional — falls back to anonymous |

## Usage

Once installed, just ask Claude:

> *"Get a second opinion on this race condition I'm hitting in our worker pool."*

Claude will call the tool, pass your code + context, and synthesize a response from all three sources.

## Stack

- **TypeScript** + **Node.js 18+**
- **@modelcontextprotocol/sdk**
- **@google/generative-ai** (Gemini)
- **Perplexity API**
- **Stack Exchange API**

## Related MCP servers

- 🔍 **[mcp-perplexity-server](https://github.com/joewilsonai/mcp-perplexity-server)** (⭐ 14) — Perplexity-only, lighter weight
- 🐙 **[github-meta-mcp-server](https://github.com/joewilsonai/github-meta-mcp-server)** — Natural-language GitHub repo management

## License

MIT
