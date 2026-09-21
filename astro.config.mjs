// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import remarkMath from 'remark-math';
import rehypeKatex from 'rehype-katex';

// https://astro.build/config
//
// `site` must be THIS SITE's own URL (used to generate the sitemap and
// canonical <link> tags) — not the name of whatever host you're deploying
// to. Update it once you know the real URL:
//
// Deploying to GitHub Pages? Set `site` to your Pages URL and `base` to your
// repo name (with leading/trailing slashes), e.g.:
//   site: 'https://<your-username>.github.io',
//   base: '/safe-dip/',
// Deploying to Vercel? Vercel serves from the domain root, so leave `base`
// unset (or '/') and set `site` to the *.vercel.app URL Vercel assigns you
// after your first deploy (or your custom domain, once you attach one). See
// README.md for the full walkthrough for both targets.
export default defineConfig({
	site: 'https://safe-dip.vercel.app',
	markdown: {
		remarkPlugins: [remarkMath],
		rehypePlugins: [rehypeKatex],
	},
	integrations: [
		starlight({
			title: 'Safe Dip',
			description:
				'Safe Dip is an automated pick-and-place system that dips metal components into hot wax baths without a worker needing to be in direct contact with the process. Senior design capstone project, Valencia College ECET.',
			logo: {
				src: './src/assets/safe-dip-icon.svg',
				replacesTitle: false,
			},
			favicon: '/favicon.svg',
			head: [
				// PNG fallbacks for browsers that don't accept an SVG favicon,
				// plus the iOS home-screen icon.
				{
					tag: 'link',
					attrs: {
						rel: 'icon',
						href: '/favicon-32.png',
						type: 'image/png',
						sizes: '32x32',
					},
				},
				{
					tag: 'link',
					attrs: {
						rel: 'apple-touch-icon',
						href: '/apple-touch-icon.png',
						sizes: '180x180',
					},
				},
			],
			customCss: ['./src/styles/custom.css', 'katex/dist/katex.min.css'],
			components: {
				Footer: './src/components/SiteFooter.astro',
			},
			social: [
				{
					icon: 'seti:git',
					label: 'Repository',
					href: 'https://github.com/',
				},
			],
			sidebar: [
				{
					label: 'About / Meet the Team',
					link: '/about/',
				},
				{
					label: 'Senior Design Proposal',
					items: [
						{ label: 'Proposed & Alternate Ideas', slug: 'proposal/ideas' },
						{ label: 'Engineering Requirements', slug: 'proposal/engineering-requirements' },
						{ label: 'Engineering Specifications', slug: 'proposal/engineering-specifications' },
						{ label: 'Block Diagrams & Flow Charts', slug: 'proposal/block-diagrams' },
						{ label: 'Comparable Products Survey', slug: 'proposal/comparable-products' },
						{ label: 'Task Distribution & Responsibilities', slug: 'proposal/task-distribution' },
						{ label: 'Timeline', slug: 'proposal/timeline' },
						{ label: 'Monetary Budget', slug: 'proposal/monetary-budget' },
						{ label: 'Power Budget', slug: 'proposal/power-budget' },
						{ label: 'CAD Drawings & Renderings', slug: 'proposal/cad' },
						{ label: 'Proposal Report & Presentation', slug: 'proposal/report-and-presentation' },
					],
				},
				{
					label: 'Senior Design / Build',
					items: [
						{ label: 'Progress Log', slug: 'build/progress-log' },
						{ label: 'Weekly Meetings', slug: 'build/weekly-meetings' },
						{ label: 'Time & Effort Tracking', slug: 'build/time-and-effort' },
						{ label: 'Engineering Requirements', slug: 'build/engineering-requirements' },
						{ label: 'Engineering Specifications', slug: 'build/engineering-specifications' },
						{ label: 'Block Diagrams & Flow Charts', slug: 'build/block-diagrams' },
						{ label: 'Task Distribution & Responsibilities', slug: 'build/task-distribution' },
						{ label: 'Final Timeline', slug: 'build/final-timeline' },
						{ label: 'Monetary Budget', slug: 'build/monetary-budget' },
						{ label: 'Power Budget', slug: 'build/power-budget' },
						{ label: 'CAD Drawings & Renderings', slug: 'build/cad' },
						{ label: 'Final Testing & Results', slug: 'build/final-testing-and-results' },
						{ label: 'Final Report & Presentation', slug: 'build/report-and-presentation' },
					],
				},
				{
					label: 'References',
					link: '/references/',
				},
				{
					label: 'Engineering Standards & Compliance Codes',
					link: '/standards/',
				},
			],
		}),
	],
});
