---
type: openapi
spec_available: true
spec_path: ./1.0.0/openapi.json
base_url: https://sandbox.api.axapartners.com
auth: OAuth 2.0 (Client Credentials)
endpoints: 15
vendor: axapartners.com
api_slug: main
category: insurance
tags: [travel insurance, policy management, quote generation, insurance API, AXA]
provenance: vendor-official
---

# AXA Partners Travel API

**OpenAPI spec included** · [View spec →](./1.0.0/openapi.json) · *Official vendor spec, indexed by Jentic.*

Quote, subscribe, manage, and cancel travel insurance policies and orders through AXA Partners across 15 endpoints.

| | |
|---|---|
| **Base URL** | `https://sandbox.api.axapartners.com` |
| **Auth** | OAuth 2.0 (Client Credentials) |
| **Endpoints** | 15 |

## What you can build with this API

- Generate travel insurance quotes based on trip dates, destination, and traveller profiles
- Subscribe customers to travel insurance policies and finalize coverage with payment details
- Cancel active policies and handle payment rectification for failed transactions
- Retrieve policy documents and attachments such as certificates of insurance
- Place and track travel insurance orders with customer communication triggers

Does not handle claims filing or claims adjudication — use it for policy sales, quoting, and lifecycle management only.

## Key endpoints

| Method | Path | Description |
|--------|------|-------------|
| POST | /sales/v2/individual/travel/quotes_requests | Get travel insurance quotes |
| POST | /sales/v2/individual/travel/policies | Subscribe to a policy |
| POST | /sales/v2/individual/travel/policies/{policy_id}/finalize | Finalize a policy subscription |
| POST | /sales/v2/individual/travel/policies/{policy_id}/cancel | Cancel a policy |
| POST | /sales/v2/individual/travel/orders | Create an insurance order |
| GET | /sales/v2/individual/travel/policies/{policy_id} | Get policy details |

## Key resources

| Resource | Description |
|----------|-------------|
| Quotes | Request travel insurance quotes based on trip and traveller details |
| Policies | Subscribe, finalize, cancel, and retrieve travel insurance policies |
| Orders | Create and manage insurance purchase orders |
| Attachments | Retrieve policy documents and certificates |

## Use this API with Jentic

| Platform | Install | Works with |
|----------|---------|------------|
| **MCP** | Server URL: `https://api.jentic.com/mcp` | Claude Desktop, Cursor, Windsurf, Claude Code |
| **OpenClaw** | `clawhub install jentic` | OpenClaw agents |
| **Python** | `pip install jentic` | LangChain, CrewAI, AutoGen, custom agents |

See setup guides: [Claude Desktop](https://docs.jentic.com/guides/mcp/claude-desktop-remote/) | [Cursor](https://docs.jentic.com/guides/mcp/cursor-remote/) | [Windsurf](https://docs.jentic.com/guides/mcp/windsurf-remote/) | [ChatGPT](https://docs.jentic.com/guides/mcp/chatgpt/)

TypeScript SDK not yet available — [request it here](https://github.com/jentic/jentic-public-apis/issues).

### Python quickstart

Three steps: search for what you need, load the operation schema, execute. Your agent calls this API through Jentic without touching API keys — credentials are injected server-side at runtime.

```python
import asyncio
from jentic import Jentic, SearchRequest, LoadRequest, ExecutionRequest

async def main():
    client = Jentic()
    search = await client.search(SearchRequest(query="get a travel insurance quote for a trip"))
    entity_id = search.results[0].id
    details = await client.load(LoadRequest(ids=[entity_id]))
    result = await client.execute(
        ExecutionRequest(
            id=entity_id,
            inputs={"destination": "FR", "departure_date": "2026-06-01", "return_date": "2026-06-14", "travellers": [{"birth_date": "1990-05-15"}]}
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

- [AXA Partners Travel API Documentation](https://move-portal.axa-assistance.com/)

---

*Part of the [Jentic API Catalog](https://github.com/jentic/jentic-public-apis) — 10,000+ APIs with OpenAPI specs ready for AI agent integration. [Get started →](https://app.jentic.com/sign-up)*

<!-- jentic:discovery
search_terms: travel insurance, insurance quotes, policy subscription, AXA, travel coverage, insurance API, policy management
openapi_spec: available
vendor_spec_available: true
category: insurance
-->
