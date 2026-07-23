# Dotfiles

Personal development environment managed with [chezmoi](https://www.chezmoi.io/).

## Contains: 
- Neovim Configuration 
- Git Configuration

## Bootstrap: 
Install chezmoi: 
```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```
Initalize this repository: 
```bash
chezmoi init git@github.com:scveatch/dotfiles.git
chezmoi apply
```

Custom configurations are available depending on profile. Currently, supported profiles are "home" and "work". These
would modify the email, ssh hosts, neovim plugins, and any work-specific tooling. 

## Development tools: 

### Rust 
Rust is managed with `rustup`. Currently required development tools are: 
```bash
rustup component add rustfmt clippy
```
Rust also requires rust-analyzer to be installed via `Mason` in neovim.

### Python 
Python is managed with `uv`. A suggested globally installed tool is `ruff`: 
```bash 
uv tool install ruff
```
Some additional suggest tools are: `pyright` and `pytest`. As a general rule, the specifics of any project dependencies
are managed using a `pyproject.toml`.

## Formatters: 
|Language   | Formatter |
|---|---|
|Python   |ruff   |
|Rust    |rustfmt   |
|Lua   |stylua   |
|Haskell |ormolu   |

## Maintenance: 
Check for changes with 
```bash 
chezmoi status
```
Update from the repo with: 
```bash
chezmoi update
```
Apply any changes with 
```bash
chezmoi apply
```
