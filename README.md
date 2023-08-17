# Deploying to nginx webserver

Adapted from [AveryanAlex's blog](https://averyan.ru/en/p/nix-flakes-hugo)

```nix
{
  inputs.blog.url = "git+https://git.krsnik.at/Kristian/blog"
}
```

Setup nginx virtualHost to serve your site:

```nix
{ inputs, pkgs, ... }:
{
  services.nginx.virtualHosts."blog.krsnik.at" = {
    root = inputs.packages.default.${pkgs.hostPlatform.system};
    ssl = {
      enableACME = true;
      forceSSL = true;
    };
  };
}
```
Test