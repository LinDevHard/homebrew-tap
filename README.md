# LinDevHard Homebrew Tap

Homebrew tap for LinDevHard CLI tools.

## Install wadb

```sh
brew tap LinDevHard/tap
brew install wadb
```

`wadb` pairs Android devices over ADB Wi-Fi using a terminal QR code.

It requires `adb` at runtime. If you do not already have Android platform-tools:

```sh
brew install --cask android-platform-tools
```

## Update formulae

When a new `wadb` release is published, update `Formula/wadb.rb` with the new
version, asset URLs, and `sha256` values from the GitHub release.
