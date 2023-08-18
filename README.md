# Kristian's Reproducible Website

[![GitHub Pages Status](https://github.com/Krsnik/blog/actions/workflows/blog.yaml/badge.svg)](https://github.com/Krsnik/blog/actions/workflows/blog.yaml)

This project is my personal website, using Hugo with asciidoc as a static site generator.
The site is hosted on GitLab pages, using the supplied `.gitlab-ci.yaml` file, which just builds the `flake.nix` file.

## Development

To preview changes serve the website with `hugo serve -D`. This will build all content that has `draf: true` set in the header.
This will also build the theme's content, if it includes one.
If you are only interested how the published site will look do `hugo serve`.

## Deployment

This repo includes CI/CD configurations for GitHub and GitLab, so all you need to do is push any changes.
