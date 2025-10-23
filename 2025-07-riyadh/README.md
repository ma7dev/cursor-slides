# Cursor Slidev Kit

This repository provides a template for Cursor Ambassadors and Team members to create presentations using Slidev, powered by Cursor.

It includes a custom component, `GlowBackground.vue`, located in the `components/` directory, which adds an animated glowing background effect to your slides. You can see an example of its usage in `slides.md`.

## Getting Started

To start the slide show locally:

- `pnpm install`
- `pnpm dev`
- visit <http://localhost:3030>

Edit the [slides.md](./slides.md) to see the changes.

Learn more about Slidev at the [documentation](https://sli.dev/).

## Hosting on GitHub Pages

To deploy your slides to GitHub Pages:

1.  **Commit and push all your changes** to the `main` branch (or your desired publishing branch). This includes the workflow file located at `.github/workflows/deploy.yml`.
2.  **Configure GitHub Pages**:
    *   Go to your repository's **Settings** tab.
    *   Navigate to the **Pages** section in the sidebar.
    *   Under "Build and deployment", select **GitHub Actions** as the **Source**.
    *   GitHub Actions will automatically detect the `deploy.yml` workflow and build/deploy your slides.
    *   Once the deployment is complete, your slides will be available at `https://<your-username>.github.io/<your-repository-name>/`.

## Custom Components

### `GlowBackground.vue`

This component provides an animated, conic-gradient background with a subtle glowing and scaling effect.

**Usage:**

Wrap your slide content with the `<GlowBackground>` tag:

```html
<GlowBackground>
  <h1>Your Slide Title</h1>
  <p>More content here...</p>
</GlowBackground>
```

Refer to `slides.md` for a practical example and `components/GlowBackground.vue` for the component's source code.

## Cursor Rules

This project includes helpful Cursor Rules to guide you when creating and editing slides:

-   **`create-slidev-slides.mdc`**: Provides comprehensive guidelines on how to create slides using Slidev, covering syntax, frontmatter, components, and various features. Refer to this rule for best practices when working with `slides.md`.
-   **`cursor-brand-guidelines.mdc`**: Outlines the monochrome branding guidelines for Cursor, including color palettes, typography, logo usage, and component styling. Ensure your slides adhere to these guidelines to maintain brand consistency.

You can find these rules in the `.cursor/rules/` directory of this repository. They are designed to assist the AI in understanding the project structure and conventions.
