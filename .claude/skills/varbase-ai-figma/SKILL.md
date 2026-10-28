---
name: varbase-ai-figma
description: "Apply, repair and verify Varbase AI Figma on a Varbase 11 site: Figma to Canvas: the AI Figma engine, the Varbase customization and the Canvas AI Orchestrator wiring (Varbase AI Figma Base and the Varbase AI Figma module). Install and apply commands, inputs, config, post-apply steps, browser checks, traps and versions, read from the recipe code. Use when adding, fixing or checking Varbase AI Figma."
---

# Varbase AI Figma

Read from `recipe.yml`, `composer.json`, README, CHANGELOG and `git log` at the latest tag, 28 October 2026. Re-check versions on drupal.org before relying on them. For the full Varbase AI apply order, see the Varbase AI recipes docs page.

## Recipes

| Recipe | Latest | Stability | Require |
|---|---|---|---|
| `varbase_ai_figma_base` | 1.0.5 | stable | `drupal/varbase_ai_figma_base:~1` |
| `varbase_ai_figma (module)` | 1.0.5 | stable | brought by figma_base |

Docs (the code wins where they differ):
- https://docs.varbase.vardot.com/developers/understanding-varbase/varbase-ai-recipes/varbase-ai-figma-base
- https://docs.varbase.vardot.com/developers/understanding-varbase/varbase-ai-recipes/varbase-ai-figma

## What it does

- Applies `drupal_cms_ai` and `varbase_ai_context`. Installs `ai`, `ai_agents`, `scheduler`, `ai_context`, `key`, `easy_encryption`, `canvas_ai`, `ai_figma`, `varbase_ai_figma`, `ai_agent_modes`. Creates Key `drupal_varbase_figma_token`, sets `ai_figma.settings`, eight agent modes (component, figma_page, page, page_review, pattern, pattern_create, section, site_connect), and gives `canvas_ai_orchestrator` the inventory and design-resolver tools. Resolver tuning lives in `varbase_ai_figma.settings`.
- Inputs: `figma_access_token`, `figma_file_key` (env `FIGMA_ACCESS_TOKEN`, `FIGMA_FILE_KEY`).
- Composer: `drupal/core ~11.4.0`, `drupal_cms_ai ~2`, `canvas ^1.6`, `ai ^1.1`, `ai_agents ^1.1`, `ai_context ^1.0`, `ai_agent_modes ~1.0.0`, `ai_figma ~1.0.0` (1.0.2), `key ^1.18`, `easy_encryption ^1.0`, `varbase_ai_context ~1.0.0`, `varbase_ai_figma ~1.0.0`.

## Apply

All commands in DDEV, from the project root; recipes are applied from the docroot path `../recipes/<name>`. Take a snapshot first: `ddev snapshot --name before-varbase-ai-figma`. Add each recipe to `extra.drupal-recipe-unpack.ignore` in `composer.json` before requiring it (read the list first: `composer config --json` replaces it).

```bash
ddev composer require drupal/varbase_ai_figma_base:~1
ddev drush cr
ddev drush recipe ../recipes/varbase_ai_figma_base -y \
  --input=varbase_ai_figma_base.figma_access_token= \
  --input=varbase_ai_figma_base.figma_file_key=
```

Then add the token in Configuration > System > Keys and the file key in the AI Figma settings. Never pass a real token on the command line.

## After the apply

- Built for Vartheme BS5 (Bootstrap 5.3) components; on a template theme the resolver reuses what that theme ships.

## Verify

- In Canvas, ask the AI assistant to build a page from a Figma frame link: it lists the components it reuses before it builds.

Test as a real editor or visitor, not user 1: a superuser bypasses permissions.

## Traps

- Design tools other than Figma are out of scope here.

## History

Started July 2026, 1.0.0 to 1.0.5 (24 Oct 2026); 1.0.3 machine-name Key id (#3628387).
