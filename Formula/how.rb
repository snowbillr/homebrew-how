class How < Formula
  desc "CLI utility for helping to construct CLI commands for different tasks"
  homepage "https://github.com/snowbillr/how/"
  url "https://github.com/snowbillr/how/releases/download/v0.3.0/how-0.3.0.gem"
  sha256 "ddfd747f41ffbee536e6c214ac82cd378e2bd3603562394d9e75fccf92592b9c"
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
