# Installation

## Apply the recipe

```bash
composer require drupal/varbase_ai_figma_base
ddev drush recipe ../recipes/varbase_ai_figma_base -y
ddev drush cr
```

This applies, in order: `drupal_cms_ai` (AI providers and API keys) and
`varbase_ai_context` (Context Control Center + the Varbase starter context
items), then installs `ai`, `ai_agents`, `scheduler`, `ai_context`, `key`,
`easy_encryption`, `canvas_ai`, `ai_figma`, `varbase_ai_figma` and
`ai_agent_modes`.

At install the recipe asks for:

- the **AI provider** and its API key (from Drupal CMS AI; leave the key
  fields empty when the providers are already configured and nothing is
  overwritten),
- your **Figma access token** (stored in the `drupal-varbase-figma-token`
  key), and
- the **default Figma file key** used when a prompt has no Figma link.

## What you get

- The **Figma access token** stored and wired to `ai_figma`, so the site
  reads your Figma file right after apply. Left it empty? Fill it in later at
  `/admin/config/system/keys`
  (see [AI Figma's installation docs](https://project.pages.drupalcode.org/ai_figma/installation/)
  for connecting it).
- The Canvas AI panel wired to the `canvas_ai_orchestrator` agent, which now
  has the resolver and build tools this recipe grants (see
  [Configuration](configuration.md)).
- Permissions granted to the standard Varbase roles (Site Admin, Content
  Admin, Content Editor), so people other than user 1 can actually use it.

## Re-apply after a customisation

The recipe's config actions are safe to re-run: `drush recipe
../recipes/varbase_ai_figma_base -y` again after upgrading a dependency, or
after `simpleConfigUpdate` on the orchestrator's `tools` map has been
overwritten by something else; see the warning in
[Configuration](configuration.md#orchestrator-tools).

## Uninstall

Recipes are not reversible as a unit; uninstall the modules they installed
individually if needed, e.g.:

```bash
ddev drush pmu varbase_ai_figma ai_figma canvas_ai -y
```
