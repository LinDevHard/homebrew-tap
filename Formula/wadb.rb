class Wadb < Formula
  desc "Pair Android devices over ADB Wi-Fi using a terminal QR code"
  homepage "https://github.com/LinDevHard/wadb"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/LinDevHard/wadb/releases/download/v1.1.1/wadb-darwin-arm64-1.1.1.tar.gz"
      sha256 "0b46addda27536643b7dc8926945aa5c5f654de7219d9564a8d69a69afa1160a"
    end

    on_intel do
      url "https://github.com/LinDevHard/wadb/releases/download/v1.1.1/wadb-darwin-amd64-1.1.1.tar.gz"
      sha256 "aa69a50b5baf50d5dfaa1e185c24b62571f5f7f59a8244cc02bd60ae8da81ce3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/LinDevHard/wadb/releases/download/v1.1.1/wadb-linux-arm64-1.1.1.tar.gz"
      sha256 "4e8928bf8dad78e807f337f113606bb6c2d6e373e24114513d2d5ebe23f0bd3e"
    end

    on_intel do
      url "https://github.com/LinDevHard/wadb/releases/download/v1.1.1/wadb-linux-amd64-1.1.1.tar.gz"
      sha256 "45adf7c9a1e85dd849bdb095110a29b4cdb0d6fe1a0f0a0e9893aae1d0ad45a5"
    end
  end

  def install
    bin.install "wadb"
    doc.install "README.md"
    man1.install "man/wadb.1"
    bash_completion.install "completions/wadb.bash" => "wadb"
    zsh_completion.install "completions/wadb.zsh" => "_wadb"
    fish_completion.install "completions/wadb.fish" => "wadb.fish"
  end

  def caveats
    <<~EOS
      wadb shells out to adb for Android wireless pairing.
      Install Android platform-tools if adb is not already available:
        brew install --cask android-platform-tools
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wadb --version")
    assert_match "pair Android devices", shell_output("#{bin}/wadb --help 2>&1")
  end
end
