# Safe Dip — Senior Design Documentation Site

Documentation website for **Safe Dip**, an ECET senior design capstone project at Valencia College (Orlando, FL) by Josué Bouchard & Adriano Duque Mena. Built with [Astro](https://astro.build) and the [Starlight](https://starlight.astro.build) documentation framework.

**Maintaining this site with an AI assistant (Claude, ChatGPT/Codex, Cursor, etc.)?** Read [`AGENTS.md`](./AGENTS.md) first — it covers the project's conventions, content sourcing, and known gotchas in more detail than this README.

## Project structure

```
.
├── public/                     static assets served as-is: favicons, the proposal PDF/PPTX
├── src/
│   ├── assets/                 images referenced from content (Astro-optimized)
│   ├── components/              Accordion, DownloadCard, EffortWeek, Lightbox, SiteFooter,
│   │                           SiteHeader, TeamMember, TopNav
│   ├── content/
│   │   └── docs/               all documentation pages (Markdown/MDX)
│   │       ├── about.mdx
│   │       ├── proposal/       Senior Design Proposal section
│   │       ├── build/          Senior Design / Build section
│   │       ├── references.md
│   │       └── standards.md
│   ├── content.config.ts       Starlight content collection config
│   ├── pages/
│   │   └── index.astro         custom landing page (NOT part of the docs collection)
│   └── styles/
│       └── custom.css          blue theme, light + dark mode
├── senior-proposal-typst/      Typst source for the proposal report, as submitted (see AGENTS.md)
├── .claude/skills/             weekly-update skill: finds missing weeks, guides the entries
└── astro.config.mjs            site config, sidebar structure, integrations
```

Sidebar navigation is configured in `astro.config.mjs` — add a new page by creating a Markdown/MDX file under `src/content/docs/` and adding an entry to the matching `sidebar` group. See `AGENTS.md` for the full page-adding checklist.

## Commands

| Command             | Action                                       |
| :------------------- | :-------------------------------------------- |
| `npm install`        | Install dependencies                          |
| `npm run dev`         | Start the local dev server at `localhost:4321`|
| `npm run build`       | Build the production site to `./dist/`        |
| `npm run preview`     | Preview the production build locally          |

## Deploying

The site is a fully static build (`npm run build` → `dist/`), so it can be hosted for free on either GitHub Pages or Vercel. **It is currently hosted on Vercel** (production at `https://safe-dip.vercel.app`, built from `main`; every other branch gets a preview URL). Option A is kept only as an alternative.

### Option A — GitHub Pages

1. Push this repository to GitHub.
2. In `astro.config.mjs`, set `site` and `base` to match your GitHub Pages URL, e.g.:

   ```js
   export default defineConfig({
     site: 'https://<your-username>.github.io',
     base: '/<your-repo-name>/',
     // ...
   });
   ```

3. Add a workflow file at `.github/workflows/deploy.yml`:

   ```yaml
   name: Deploy to GitHub Pages
   on:
     push:
       branches: [main]
   permissions:
     contents: read
     pages: write
     id-token: write
   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v4
         - uses: withastro/action@v3
     deploy:
       needs: build
       runs-on: ubuntu-latest
       environment:
         name: github-pages
         url: ${{ steps.deployment.outputs.page_url }}
       steps:
         - id: deployment
           uses: actions/deploy-pages@v4
   ```

4. In the repo's **Settings → Pages**, set the source to "GitHub Actions".
5. Push to `main` — the site will build and deploy automatically.

### Option B — Vercel

1. Push this repository to GitHub (or GitLab/Bitbucket).
2. In [Vercel](https://vercel.com), click **Add New → Project** and import the repository.
3. Vercel auto-detects the Astro framework preset — no configuration needed. Leave `base` unset (or `/`) in `astro.config.mjs` since Vercel serves from the domain root; set `site` to the Vercel URL Vercel gives you (e.g. `https://safe-dip.vercel.app`).
4. Click **Deploy**. Every push to the connected branch redeploys automatically.

## Content notes

- The Proposal pages come from the team's senior design proposal. The Build pages start as carried-forward copies; the weekly pages (Progress Log, Time & Effort, Weekly Meetings) are written each week from the team's own notes, using the `weekly-update` skill. Pages still carrying `TODO` placeholders include Final Testing & Results (the result cells) and the "Weeks" column of the Final Timeline. See `AGENTS.md` for what is real vs. placeholder and where content is sourced from.
- The `senior-proposal-typst/` folder (Typst source for the proposal report, as submitted) is kept in the repo as reference material and to regenerate diagrams/charts; it is not part of the built site itself. The live report is edited in the Typst web app and is ahead of that snapshot.
