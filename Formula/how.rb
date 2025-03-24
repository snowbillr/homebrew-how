class How < Formula
  desc "CLI utility for helping to construct CLI commands for different tasks"
  homepage "https://github.com/snowbillr/how/"
  url "https://github.com/snowbillr/how/releases/download/v0.4.0/how-0.4.0.gem"
  sha256 "6346eaf3863e5587acc8a2e57b896694ea4a5f918ea124555bcb513af2ede82e"
  license "MIT"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec

    system "gem", "install", cached_download, "--install-dir", libexec

    bin.install libexec/"bin/how"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    assert_match "Explain how to use TOOL to accomplish TASK_DESCRIPTION", shell_output("#{bin}/how --help")
  end
end
