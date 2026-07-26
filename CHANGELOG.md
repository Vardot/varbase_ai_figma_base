# Changelog

All notable changes to the Varbase AI Figma Base recipe are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0-alpha2] - 2026-07-26
### Added
- Ask for the Figma access token and the default Figma file key at install (recipe input prompts), and apply the Drupal CMS AI and Varbase AI Context recipes first.

## [1.0.0-alpha1] - 2026-07-23
### Added
- Initial release of the Varbase AI Figma Base recipe: applies Varbase AI Base, installs `ai_figma` + `varbase_ai_figma` + Context Control Center (`ai_context`) + `ai_agent_modes`, wires the Canvas AI Orchestrator's tool list, and grants Figma/Canvas AI permissions to the Site Admin, Content Admin, and Content Editor roles instead of leaving them admin-only.

[Unreleased]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/compare/1.0.0-alpha2...1.0.x
[1.0.0-alpha2]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/compare/1.0.0-alpha1...1.0.0-alpha2
[1.0.0-alpha1]: https://git.drupalcode.org/project/varbase_ai_figma_base/-/tags/1.0.0-alpha1
