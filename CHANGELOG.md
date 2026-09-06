# Changelog

All notable changes to the Varbase AI Figma Base recipe are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[Unreleased]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/compare/1.0.0...1.0.x
[1.0.0]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/compare/1.0.0-rc2...1.0.0
[1.0.0-rc2]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/compare/1.0.0-rc1...1.0.0-rc2
[1.0.0-rc1]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/compare/1.0.0-alpha2...1.0.0-rc1
[1.0.0-alpha2]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/compare/1.0.0-alpha1...1.0.0-alpha2
[1.0.0-alpha1]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/tags/1.0.0-alpha1
