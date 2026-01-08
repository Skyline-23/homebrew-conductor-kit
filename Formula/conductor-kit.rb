class ConductorKit < Formula
  desc "Global skills pack and Go helper for Codex CLI and Claude Code"
  homepage "https://github.com/Skyline-23/conductor-kit"
  url "https://github.com/Skyline-23/conductor-kit/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6b3c815ca994fa6ce2d5802a15c6ee99fe9a9bc8f66eb40b2d61060e59e70e65"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"conductor", "./cmd/conductor"
    pkgshare.install "skills", "commands", "config"
  end

  def caveats
    <<~EOS
      To install skills and commands into Codex/Claude:
        conductor install --mode link --repo #{pkgshare}
    EOS
  end

  test do
    system "#{bin}/conductor", "--help"
  end
end
