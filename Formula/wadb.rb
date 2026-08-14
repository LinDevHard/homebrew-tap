class Wadb < Formula
  desc "Pair Android devices over ADB Wi-Fi using a terminal QR code"
  homepage "https://github.com/LinDevHard/wadb"
  version "1.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/LinDevHard/wadb/releases/download/v1.1.0/wadb-1.1.0-darwin-arm64.tar.gz"
      sha256 "40d3999d9e1212a3bbd755273d75270666802e16caca9070f037fbc1835f66d7"
    end

    on_intel do
      url "https://github.com/LinDevHard/wadb/releases/download/v1.1.0/wadb-1.1.0-darwin-amd64.tar.gz"
      sha256 "628af518810b65c867cbb8f9f4ed7fa4c066d635c513e89c9657f51fb046ae0b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/LinDevHard/wadb/releases/download/v1.1.0/wadb-1.1.0-linux-arm64.tar.gz"
      sha256 "1075044b94da87097e2cf8eb83cb9aaade8ce5d109c5323f0c77715de3b0ccdb"
    end

    on_intel do
      url "https://github.com/LinDevHard/wadb/releases/download/v1.1.0/wadb-1.1.0-linux-amd64.tar.gz"
      sha256 "387412dd2ee3287e32047fbff916fec9decc283852b4781c5d914616195a2d80"
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
