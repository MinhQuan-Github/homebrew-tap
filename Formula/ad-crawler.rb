class AdCrawler < Formula
  desc "CLI for collecting ad library page data and downloading discovered media"
  homepage "https://github.com/MinhQuan-Github/ad-crawler"
  url "https://github.com/MinhQuan-Github/ad-crawler/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "UNLICENSED"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/ad-crawler"
  end

  def caveats
    <<~EOS
      Run this once after install:
        ad-crawler setup

      Then create a local config:
        ad-crawler init
    EOS
  end

  test do
    assert_match "ad-crawler", shell_output("#{bin}/ad-crawler help")
  end
end
