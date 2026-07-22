# Installation

## Apply the recipe

```bash
composer require drupal/varbase_ai_figma_base
ddev drush recipe ../recipes/varbase_ai_figma_base -y
ddev drush cr
```

This installs, in order: `varbase_ai_base` (its own recipe), then `ai`,
`ai_agents`, `scheduler`, `ai_context`, `key`, `easy_encryption`, `canvas_ai`,
`ai_figma` and `varbase_ai_figma`.

## What you get

- A **Figma access token** ready to fill in at `/admin/config/system/keys`
  (see [AI Figma's installation docs](https://project.pages.drupalcode.org/ai_figma/installation/)
  for connecting it).
- The Canvas AI panel wired to the `canvas_ai_orchestrator` agent, which now
  has the resolver and build tools this recipe grants (see
  [Configuration](configuration.md)).
- Permissions granted to the standard Varbase roles — Site Admin, Content
  Admin, Content Editor — so people other than user 1 can actually use it.

## Re-apply after a customisation

The recipe's config actions are safe to re-run: `drush recipe
../recipes/varbase_ai_figma_base -y` again after upgrading a dependency, or
after `simpleConfigUpdate` on the orchestrator's `tools` map has been
overwritten by something else — see the warning in
[Configuration](configuration.md#orchestrator-tools).

## Uninstall

Recipes are not reversible as a unit; uninstall the modules they installed
individually if needed, e.g.:

```bash
ddev drush pmu varbase_ai_figma ai_figma canvas_ai -y
```
