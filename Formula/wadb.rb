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
      url "https://github.com/LinDevHard/wadb/releases/download/v1.3.0/wadb-darwin-arm64-1.3.0.tar.gz"
      sha256 "cc928ba9e9a94700aa23eeb8dd423e3af3a442558d7e66645cffe65697b0ca30"
    end

    on_intel do
      url "https://github.com/LinDevHard/wadb/releases/download/v1.3.0/wadb-darwin-amd64-1.3.0.tar.gz"
      sha256 "435b534095fa5a6ad8dd25d44761c076444dfe4c5b1dc7f5dcfd85123e0224db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/LinDevHard/wadb/releases/download/v1.3.0/wadb-linux-arm64-1.3.0.tar.gz"
      sha256 "110d5ecdea04d057bb31031460f79cea7d75176abe407a0bcb7d94e440c006da"
    end

    on_intel do
      url "https://github.com/LinDevHard/wadb/releases/download/v1.3.0/wadb-linux-amd64-1.3.0.tar.gz"
      sha256 "82172ef994b09f0e845e0181b2df9b42ccb39c603a7059d2315b0205e42b90df"
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
