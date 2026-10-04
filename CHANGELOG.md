# Changelog

All notable changes to the Varbase AI Figma Base recipe are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.3] - 2026-10-04
### Changed
- Use the machine name `drupal_varbase_figma_token`, with underscores, as the id of the Figma token key the recipe creates, instead of `drupal-varbase-figma-token`. The id is used for the key, the `key.key` config action and `ai_figma.settings` `figma_token_key`. See [#3628387](https://www.drupal.org/i/3628387).
- Set the recipe version to `1.0.3` and update the version badge in `README.md`.

### Known limitation
- This release only renames the key id. It does not reuse or migrate a key an earlier version created (the hyphenated `drupal-varbase-figma-token`, or `ai_figma`'s own default `figma`). A site that applied 1.0.2 and applies 1.0.3 keeps the old key and gets a second key with the new id. The key still uses the plain-config key provider.

## [1.0.2] - 2026-09-26
### Changed
- Update `@vardot/varbase-e2e` to 2.0.7, and keep the functional testing suite green by building CI on Twig 3.29 until a Twig release compatible with Drupal core is out. See [#3625751](https://www.drupal.org/i/3625751).
- Set the recipe version to `1.0.2` and update the version badge in `README.md`.

## [1.0.1] - 2026-09-08
### Changed
- Take the access-denied step from the Varbase functional testing suite: drop the redundant local step definition now that the shared suite provides it. See [#3621381](https://www.drupal.org/i/3621381).
- Set the recipe version to `1.0.1` and update the version badge in `README.md`.

## [1.0.0] - 2026-09-06
### Fixed
- Functional testing: require `drupal/easy_breadcrumb:^2.0.10` in the CI site build. `drupal/trash` 3.0.33 added `TrashMenuLinkManager`, decorating `plugin.manager.menu.link`; easy_breadcrumb 2.0.9 type-hinted the concrete `MenuLinkManager` and `drush site:install` died with a `TypeError`. easy_breadcrumb 2.0.10 is the upstream fix, see [#3508330](https://www.drupal.org/i/3508330).

### Changed
- First stable release of the Varbase AI Figma Base recipe.
- Pin the `drupal/varbase_ai_context` dependency to the stable `~1.0.0` release.
- Pin the `drupal/ai_agent_modes` to `~1.0.0`, `drupal/ai_figma` to `~1.0.0`, `drupal/varbase_ai_figma` to `~1.0.0` dependencies for the release.
- Update the version badge to `1.0.0` in `README.md`.

## [1.0.0-rc2] - 2026-08-16
### Fixed
- Do not ship the `tests` directory in the packaged release. The packaged test fixture recipe under `tests/recipes` installs `ai_simple_provider_installer`, a `require-dev` only module, so the Drupal CMS installer reported a recipe validation error for it before any recipe was applied. See [#3617234](https://www.drupal.org/i/3617234).

### Changed
- Pin the `drupal/ai_agent_modes` to `~1.0.0`, `drupal/ai_figma` to `~1.0.0`, `drupal/varbase_ai_context` to `~1.0.0`, `drupal/varbase_ai_figma` to `~1.0.0` dependencies for the release.
- Update the version badge to `1.0.0-rc2` in `README.md`.

## [1.0.0-rc1] - 2026-08-15
### Changed
- Pin the `drupal/ai_agent_modes` to `~1.0.0`, `drupal/ai_figma` to `~1.0.0`, `drupal/varbase_ai_context` to `~1.0.0`, `drupal/varbase_ai_figma` to `~1.0.0` dependencies for the release.
- Update the version badge to `1.0.0-rc1` in `README.md`.

## [1.0.0-alpha2] - 2026-07-26
### Added
- Ask for the Figma access token and the default Figma file key at install (recipe input prompts), and apply the Drupal CMS AI and Varbase AI Context recipes first.

## [1.0.0-alpha1] - 2026-07-23
### Added
- Initial release of the Varbase AI Figma Base recipe: applies Varbase AI Base, installs `ai_figma` + `varbase_ai_figma` + Context Control Center (`ai_context`) + `ai_agent_modes`, wires the Canvas AI Orchestrator's tool list, and grants Figma/Canvas AI permissions to the Site Admin, Content Admin, and Content Editor roles instead of leaving them admin-only.

[Unreleased]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/compare/1.0.3...1.0.x
[1.0.3]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/compare/1.0.2...1.0.3
[1.0.2]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/compare/1.0.1...1.0.2
[1.0.1]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/compare/1.0.0...1.0.1
[1.0.0]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/compare/1.0.0-rc2...1.0.0
[1.0.0-rc2]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/compare/1.0.0-rc1...1.0.0-rc2
[1.0.0-rc1]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/compare/1.0.0-alpha2...1.0.0-rc1
[1.0.0-alpha2]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/compare/1.0.0-alpha1...1.0.0-alpha2
[1.0.0-alpha1]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/tags/1.0.0-alpha1
