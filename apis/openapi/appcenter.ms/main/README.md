---
type: openapi
spec_available: true
spec_path: ./v0.1/openapi.json
base_url: https://api.appcenter.ms/
auth: API Key, Basic Auth
endpoints: 352
vendor: appcenter.ms
api_slug: main
category: devops
tags: [mobile app management, CI/CD, crash reporting, app distribution, analytics, codepush]
provenance: vendor-official
---

# App Center Client

**OpenAPI spec included** · [View spec →](./v0.1/openapi.json) · *Official vendor spec, indexed by Jentic.*

Manage mobile and desktop app lifecycles including builds, test runs, crash diagnostics, release distribution, analytics, and CodePush deployments across 352 endpoints.

| | |
|---|---|
| **Base URL** | `https://api.appcenter.ms/` |
| **Auth** | API Key, Basic Auth |
| **Endpoints** | 352 |

## What you can build with this API

- Distribute app builds to testers and release groups with per-device provisioning profiles
- Monitor crash reports grouped by stack trace and affected OS versions in real time
- Trigger CI builds from branches and pull requests with configurable build scripts
- Push over-the-air JavaScript and asset updates to React Native and Cordova apps via CodePush
- Track active device counts, session durations, and custom event analytics per app version

Does not handle app store submission or in-app purchase management — use it for build, test, distribute, and monitor workflows before and after store release.

## Key endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | /v0.1/apps | List all apps |
| POST | /v0.1/apps | Create a new app |
| GET | /v0.1/apps/{owner_name}/{app_name}/analytics/active_device_counts | Count active devices by interval |
| GET | /v0.1/apps/{owner_name}/{app_name}/crashes/{crash_group_id} | Get crash group details |
| POST | /v0.1/apps/{owner_name}/{app_name}/releases/{release_id}/groups | Distribute release to a group |
| POST | /v0.1/apps/{owner_name}/{app_name}/codepush_deployments | Create a CodePush deployment |

## Key resources

| Resource | Description |
|----------|-------------|
| Apps | Register, configure, and manage mobile and desktop applications |
| Analytics | Query device counts, session metrics, events, and audience segments |
| Crashes | Inspect crash groups, stack traces, and affected device breakdowns |
| Distribute | Manage releases, distribution groups, and provisioning profiles |
| CodePush | Deploy over-the-air updates to React Native and Cordova apps |
| Build | Trigger and monitor CI builds from source branches |

## Use this API with Jentic

| Platform | Install | Works with |
|----------|---------|------------|
| **MCP** | Server URL: `https://api.jentic.com/mcp` | Claude Desktop, Cursor, Windsurf, Claude Code |
| **OpenClaw** | `clawhub install jentic` | OpenClaw agents |
| **Python** | `pip install jentic` | LangChain, CrewAI, AutoGen, custom agents |

See setup guides: [Claude Desktop](https://docs.jentic.com/guides/mcp/claude-desktop-remote/) | [Cursor](https://docs.jentic.com/guides/mcp/cursor-remote/) | [Windsurf](https://docs.jentic.com/guides/mcp/windsurf-remote/) | [ChatGPT](https://docs.jentic.com/guides/mcp/chatgpt/)

TypeScript SDK not yet available — [request it here](https://github.com/jentic/jentic-public-apis/issues).

### Python quickstart

Jentic sits between your agent and this API. The agent searches by intent, loads operation details, and executes — while credentials stay encrypted in the vault, isolated from the agent.

```python
import asyncio
from jentic import Jentic, SearchRequest, LoadRequest, ExecutionRequest

async def main():
    client = Jentic()
    search = await client.search(SearchRequest(query="distribute a mobile app build to testers"))
    entity_id = search.results[0].id
    details = await client.load(LoadRequest(ids=[entity_id]))
    result = await client.execute(
        ExecutionRequest(
            id=entity_id,
            inputs={"owner_name": "my-org", "app_name": "my-app", "release_id": 42}
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

- [App Center Documentation](https://learn.microsoft.com/en-us/appcenter/)

---

*Part of the [Jentic API Catalog](https://github.com/jentic/jentic-public-apis) — 10,000+ APIs with OpenAPI specs ready for AI agent integration. [Get started →](https://app.jentic.com/sign-up)*

<!-- jentic:discovery
search_terms: app center, mobile CI/CD, crash reporting, app distribution, codepush, mobile analytics, build automation
openapi_spec: available
vendor_spec_available: true
category: devops
-->
