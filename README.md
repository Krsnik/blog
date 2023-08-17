# Kristian's Reproducible Website

This project is my personal website, using Hugo with asciidoc as a static site generator.
The site is hosted on GitLab pages, using the supplied `.gitlab-ci.yaml` file, which just builds the `flake.nix` file.

## Development

To preview changes serve the website with `hugo serve` and set `draft: false` in your blogpost.

## Deployment

Just push the changes to GitLab and the automatic CI/CD will build and deploy the website.
