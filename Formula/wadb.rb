class Wadb < Formula
  desc "Pair Android devices over ADB Wi-Fi via a terminal QR code"
  homepage "https://github.com/LinDevHard/wadb"
  url "https://github.com/LinDevHard/wadb.git",
      tag:      "v1.0.0",
      revision: "4e3c7c4c5f8a32a049eb560744bb76e9455b92e2"
  license "MIT"
  head "https://github.com/LinDevHard/wadb.git", branch: "main"

  depends_on "go" => :build
  depends_on "android-platform-tools"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wadb --version")
  end
end
