@ai-figma @admin @recipe
Feature: The Varbase AI Figma Base recipe sets up the AI Figma stack
  As a Varbase site builder
  I want one recipe to install the AI Figma engine, its Varbase customization
  and the AI Context items
  So that the site can build Drupal Canvas pages from a Figma link out of the box

  # The recipe is applied during CI install (drush recipe). These scenarios assert
  # the post-apply state on a Varbase site: the modules it installs are enabled,
  # the single AI Figma settings page is reachable, and the AI Context items it
  # seeds are present - every page loads with no PHP errors.

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The recipe enabled the AI Figma modules
    When I navigate to "/admin/modules"
    Then I should see "AI Figma"
     And I should see "Varbase AI Figma"
     And I the page should not have PHP errors

  Scenario: The AI Figma settings page is reachable after the recipe applies
    When I navigate to "/admin/config/ai/figma"
    Then I should see "AI Figma"
     And the "ai figma settings form" element should be visible
     And I the page should not have PHP errors

  Scenario: The recipe seeded the AI Context items
    When I navigate to "/admin/config/ai/context/items"
    Then I should see "Figma Build Rules"
     And I should see "Figma Accessibility Rules"
     And I the page should not have PHP errors

  Scenario: The AI agents configuration surface loads cleanly
    When I navigate to "/admin/config/ai/tools-automation/agents"
    Then the "drupal page heading" element should be visible
     And I the page should not have PHP errors

  Scenario: The status report is free of errors after the recipe applies
    When I navigate to "/admin/reports/status"
    Then the "drupal page heading" element should contain text "Status report"
     And I should see "AI Figma"
     And I the page should not have PHP errors
