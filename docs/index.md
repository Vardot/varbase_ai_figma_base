# Varbase AI Figma Base

The one-command way to turn on Figma-to-Drupal-Canvas building on a Varbase
11 site: applies [Varbase AI Base](https://www.drupal.org/project/varbase_ai_base)
(core AI modules + default Varbase AI configuration), installs the general
[AI Figma](https://www.drupal.org/project/ai_figma) engine and the
[Varbase AI Figma](https://www.drupal.org/project/varbase_ai_figma)
customization (Bootstrap 5.3 / vartheme_bs5 layouts, component choices, a demo
Figma file), and wires [Context Control Center](https://www.drupal.org/project/ai_context)
(`ai_context`).

The Drupal Canvas AI Orchestrator this recipe wires is taught to **resolve a
design against what the site already ships before it builds anything**: it is
given the inventory and design-resolver tools, plus the AI Context items that
tell it to reuse an existing component, pattern, block or view before creating
a new one, to bind the design to real prop names, and never to freeze live
content into static markup.

Everything the resolver reasons with (the content roles, what each signal is
worth, the reuse/adapt/create thresholds, and what is never a candidate) lives
in `varbase_ai_figma.settings`, so behaviour is tuned in config rather than in
code. See
[Varbase AI Figma's configuration docs](https://project.pages.drupalcode.org/varbase_ai_figma/configuration/).

After apply, a Varbase site builds Canvas pages from a Figma link out of the
box.

## Next steps

- [Installation](installation.md): apply the recipe.
- [Configuration](configuration.md): what the recipe grants and wires, and
  how to re-apply it after a customisation.
