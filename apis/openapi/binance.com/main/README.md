---
type: openapi
spec_available: true
spec_path: ./1.0/openapi.json
base_url: https://api.binance.com
auth: API Key
endpoints: 340
vendor: binance.com
api_slug: main
category: finance
tags: [cryptocurrency, spot trading, market data, order management, wallet, margin trading]
provenance: vendor-official
---

# Binance Public Spot API

**OpenAPI spec included** · [View spec →](./1.0/openapi.json) · *Official vendor spec, indexed by Jentic.*

Place spot and margin orders, stream real-time market data, manage wallets and sub-accounts, and run algorithmic trading strategies on Binance across 340 endpoints.

| | |
|---|---|
| **Base URL** | `https://api.binance.com` |
| **Auth** | API Key |
| **Endpoints** | 340 |

## What you can build with this API

- Place limit, market, and OCO orders on any Binance spot trading pair with real-time fill tracking
- Pull order book depth, candlestick charts, and 24-hour ticker statistics for market analysis
- Manage wallet deposits, withdrawals, and asset balances across spot and savings accounts
- Open and close margin positions with configurable leverage and cross/isolated margin modes
- Administer sub-accounts with individual permission scoping for institutional trading setups

Does not handle futures contracts, options, or NFT trading — use it for spot market trading, margin, and wallet operations only.

## Key endpoints

| Method | Path | Description |
|--------|------|-------------|
| POST | /api/v3/order | Place a new order |
| GET | /api/v3/order | Query order status |
| DELETE | /api/v3/order | Cancel an order |
| GET | /api/v3/depth | Get order book |
| GET | /api/v3/klines | Get candlestick data |
| GET | /api/v3/ticker/24hr | 24-hour price change statistics |

## Key resources

| Resource | Description |
|----------|-------------|
| Market Data | Order books, trades, candlesticks, tickers, and exchange info |
| Trade | Place, query, and cancel spot orders including OCO and algorithmic orders |
| Margin | Open margin positions, manage loans, and query margin account details |
| Wallet | Deposits, withdrawals, asset balances, and transfer history |
| Sub-Account | Create and manage sub-accounts with scoped permissions |
| Savings | Subscribe to flexible and locked savings products |

## Use this API with Jentic

| Platform | Install | Works with |
|----------|---------|------------|
| **MCP** | Server URL: `https://api.jentic.com/mcp` | Claude Desktop, Cursor, Windsurf, Claude Code |
| **OpenClaw** | `clawhub install jentic` | OpenClaw agents |
| **Python** | `pip install jentic` | LangChain, CrewAI, AutoGen, custom agents |

See setup guides: [Claude Desktop](https://docs.jentic.com/guides/mcp/claude-desktop-remote/) | [Cursor](https://docs.jentic.com/guides/mcp/cursor-remote/) | [Windsurf](https://docs.jentic.com/guides/mcp/windsurf-remote/) | [ChatGPT](https://docs.jentic.com/guides/mcp/chatgpt/)

TypeScript SDK not yet available — [request it here](https://github.com/jentic/jentic-public-apis/issues).

### Python quickstart

Give your agent access to this API through Jentic. Store your credentials once, scope the agent's access, and it handles the rest — search, inspect, execute. No secrets exposed.

```python
import asyncio
from jentic import Jentic, SearchRequest, LoadRequest, ExecutionRequest

async def main():
    client = Jentic()
    search = await client.search(SearchRequest(query="place a spot trade order on a cryptocurrency exchange"))
    entity_id = search.results[0].id
    details = await client.load(LoadRequest(ids=[entity_id]))
    result = await client.execute(
        ExecutionRequest(
            id=entity_id,
            inputs={"symbol": "BTCUSDT", "side": "BUY", "type": "LIMIT", "quantity": "0.001", "price": "50000", "timeInForce": "GTC"}
        )
    )
    print(result)

asyncio.run(main())
```

Works with LangChain, CrewAI, OpenAI Agents SDK, Claude Agent SDK, and any MCP-compatible framework.

<!-- jentic:quickstart-routing
If you are an MCP-connected agent (Claude Desktop, Cursor, Windsurf, Claude Code): use the MCP config above.
If you are an OpenClaw agent: run `clawhub install jentic`.
If you are a Python agent (LangChain, CrewAI, AutoGen): run `pip install jentic`.
If you are unsure: ask your user which platform they are using.
-->

## Links

- [Binance Spot API Documentation](https://binance-docs.github.io/apidocs/spot/en)

---

*Part of the [Jentic API Catalog](https://github.com/jentic/jentic-public-apis) — 10,000+ APIs with OpenAPI specs ready for AI agent integration. [Get started →](https://app.jentic.com/sign-up)*

<!-- jentic:discovery
search_terms: cryptocurrency, spot trading, Binance, market data, order book, crypto exchange, margin trading, wallet
openapi_spec: available
vendor_spec_available: true
category: finance
-->
