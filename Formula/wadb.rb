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
      url "https://github.com/LinDevHard/wadb/releases/download/v1.2.0/wadb-darwin-arm64-1.2.0.tar.gz"
      sha256 "1c9b717fc5428258ce1855ebe8fcc7aee9c10ec9e029507eb529d9263d7db59f"
    end

    on_intel do
      url "https://github.com/LinDevHard/wadb/releases/download/v1.2.0/wadb-darwin-amd64-1.2.0.tar.gz"
      sha256 "ec91b11275ba641100bac043e1539dfc4c13403a8f1e015958925d2c4662e476"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/LinDevHard/wadb/releases/download/v1.2.0/wadb-linux-arm64-1.2.0.tar.gz"
      sha256 "62410f71aa529fb85667e39e7fdabb210bc8143b42065eae0ba0cb71159b901b"
    end

    on_intel do
      url "https://github.com/LinDevHard/wadb/releases/download/v1.2.0/wadb-linux-amd64-1.2.0.tar.gz"
      sha256 "b07373de20c7a0e5615ddae2f8c58f1c5609689562d73c2fb6ae79d861d9505e"
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
