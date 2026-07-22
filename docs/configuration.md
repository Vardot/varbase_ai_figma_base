# Configuration

## Permissions granted

| Role | Permissions |
| --- | --- |
| Site Admin | `administer ai figma`, `use ai figma design context`, `use Drupal Canvas AI` |
| Content Admin | `use ai figma design context`, `use Drupal Canvas AI` |
| Content Editor | `use Drupal Canvas AI` |

None of these were granted to any role before this recipe existed, so on a
plain install the feature was administrator-only: a Site Admin opening the
Figma settings page got a 403, and a content editor could not open the AI
panel in Canvas at all; user 1 bypasses every permission check, which is
exactly why that went unnoticed.

## AI Context items imported

`ai_context: '*'` and `varbase_ai_figma: '*'` are imported wholesale, so every
AI Context item and every resolver setting the module ships (see
[Varbase AI Figma's configuration docs](https://project.pages.drupalcode.org/varbase_ai_figma/configuration/))
is in place immediately after apply: no separate step to seed them.

## Orchestrator tools {#orchestrator-tools}

The recipe hands `canvas_ai_orchestrator` a **deliberately short list**, in
the order it does the job:

1. **Drupal Canvas's own agents**: the page/component/metadata/template/title
   builder agents Canvas itself ships, plus `verify_task_completion`. Not
   ours; the recipe must not drop them.
2. **Understand the design**: `list_design_pages`, `get_design_context`.
3. **Understand the site, then decide**: `scan_inventory` shows what already
   exists; `resolve_design` returns REUSE / ADAPT / BUILD, region by region.
   Nothing is built before this.
4. **Build what the decision chose**: `create_canvas_page`, `page_edit`,
   `update_component_inputs`, `place_in_region`, `create_pattern`,
   `save_as_pattern`, `insert_pattern`, `export_figma_images`.
5. **Connect it to the rest of the site**: `site_wiring` (front page, URL
   aliases), `menu_link`, `apply_recipe` (Webforms/Views a region needs).
6. **Check and improve**: `preview_token_url`, `check_page_render`,
   `audit_page`, `improve_text`, `alt_text`, `meta_description`,
   `translate_page`.

Every other tool the module ships stays available at
`/admin/config/ai/tools-automation/agents` for an administrator to switch on;
it is just not handed to every site by default. See the full reference at
[Varbase AI Figma's AI Agent tools docs](https://project.pages.drupalcode.org/varbase_ai_figma/ai-agent-tools/).

!!! warning "simpleConfigUpdate replaces the whole tools map"
    The recipe's `ai_agents.ai_agent.canvas_ai_orchestrator` action uses
    `simpleConfigUpdate`, which **replaces** the entire `tools` map rather
    than merging into it. Every tool that must end up on the orchestrator
    (including Drupal Canvas's own agents) has to be listed, or re-applying
    the recipe silently deletes whatever is missing and breaks Canvas AI's own
    page builder. If you add a tool of your own, re-declare this whole list
    plus your addition rather than assuming it merges.
