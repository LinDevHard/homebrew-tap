class Wadb < Formula
  desc "Pair Android devices over ADB Wi-Fi using a terminal QR code"
  homepage "https://github.com/LinDevHard/wadb"
  version "0.2.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/LinDevHard/wadb/releases/download/v0.2.0/wadb-v0.2.0-darwin-arm64.tar.gz"
      sha256 "df258999d8954a1c5341d0bcd76b2c1fcde08be83b4bbffd1233803469621456"
    end

    on_intel do
      url "https://github.com/LinDevHard/wadb/releases/download/v0.2.0/wadb-v0.2.0-darwin-amd64.tar.gz"
      sha256 "3fefcf0fd4aaea4757eec5f57aca8f3baad5923fc87b93759d65e2b63ddb2a68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/LinDevHard/wadb/releases/download/v0.2.0/wadb-v0.2.0-linux-arm64.tar.gz"
      sha256 "25457c5503fe777ac5d8f18c5a1c4de983427273cb9888ab1ed83e995a9fe189"
    end

    on_intel do
      url "https://github.com/LinDevHard/wadb/releases/download/v0.2.0/wadb-v0.2.0-linux-amd64.tar.gz"
      sha256 "fad6552d50b2878c5b70e3de3832ee167239d870d7cdf52f745fa60cc5109ac8"
    end
  end

  def install
    bin.install "wadb"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      wadb shells out to adb for Android wireless pairing.
      Install Android platform-tools if adb is not already available:
        brew install --cask android-platform-tools
    EOS
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/wadb --version")
    assert_match "pair Android devices", shell_output("#{bin}/wadb --help 2>&1")
  end
end
