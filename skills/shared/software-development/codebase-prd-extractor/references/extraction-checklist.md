# Extraction Checklist

Use this checklist while reading the codebase. Do not force every item into the final spec if it is irrelevant.

## Repository Shape

- Identify the executable apps, packages, services, or deployable units.
- Identify the primary frameworks and runtime environments so you can locate behavior correctly.
- Identify where configuration is loaded and how environments differ.

## Entry And Exit Points

- HTTP routes, controllers, handlers, or RPC methods
- Message consumers and publishers
- Scheduled jobs and background workers
- CLI commands
- Frontend pages, screens, or major interaction flows
- Webhooks and third-party integrations

## Data Model

- Primary entities and relationships
- Persistence layers and ownership boundaries
- Validation rules and derived fields
- Migrations, seed data, and backfills

## Behavior

- Happy paths
- State machines and lifecycle transitions
- Authorization and permission checks
- Feature flags and conditional behavior
- Error handling, retries, and idempotency

## Operational Details

- Required environment variables and secrets
- External services and infrastructure dependencies
- Concurrency assumptions, locking, or queues
- Caching layers and invalidation rules

## Rewrite Risks

- Behavior encoded only in tests
- Implicit coupling across modules or services
- Legacy compatibility requirements
- Hidden data dependencies
- Order-sensitive side effects
- Stack-specific behavior that looks important but may actually be an incidental implementation choice
