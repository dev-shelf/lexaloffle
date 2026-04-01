# Dev-shelf Lexaloffle

## How do I install these formulae?

`brew install dev-shelf/lexaloffle/<formula>`

Or `brew tap dev-shelf/lexaloffle` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "dev-shelf/lexaloffle"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Bump Picotron Cask

Use these commands when a new Picotron version is released.

1. Check for a new version:

```sh
brew livecheck --cask dev-shelf/lexaloffle/picotron
```

2. Download the new archive (replace `NEW_VERSION`):

```sh
HOMEBREW_LEXALOFFLE_EMAIL="name@example.com" \
HOMEBREW_PICOTRON_URL_TOKEN="your-download-token" \
curl -fL "https://www.lexaloffle.com/dl/user/${HOMEBREW_LEXALOFFLE_EMAIL}/${HOMEBREW_PICOTRON_URL_TOKEN}/picotron_NEW_VERSION_osx.zip" \
	-o "/tmp/picotron_NEW_VERSION_osx.zip"
```

3. Calculate SHA-256:

```sh
shasum -a 256 "/tmp/picotron_NEW_VERSION_osx.zip"
```

4. Update `version` and `sha256` in `Casks/picotron.rb`.

5. Validate and test:

```sh
brew audit --cask --strict dev-shelf/lexaloffle/picotron

HOMEBREW_LEXALOFFLE_EMAIL="name@example.com" \
HOMEBREW_PICOTRON_URL_TOKEN="your-download-token" \
brew reinstall --cask --force picotron
```

## Automated maintenance (CI)

This tap includes a scheduled workflow in `.github/workflows/picotron-auto-bump.yml`.

- It runs weekly on Monday, but only executes on even ISO weeks (biweekly).
- It checks `brew livecheck` for `picotron`.
- If outdated, it downloads the new archive, computes `sha256`, updates `Casks/picotron.rb`, runs audit, and opens a PR.

Required repository secrets:

- `HOMEBREW_LEXALOFFLE_EMAIL`
- `HOMEBREW_PICOTRON_URL_TOKEN`

Optional:

- Run manually any time from GitHub Actions using `workflow_dispatch`.
