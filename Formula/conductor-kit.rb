class ConductorKit < Formula
  desc "Global skills pack and Go helper for Codex CLI and Claude Code"
  homepage "https://github.com/Skyline-23/conductor-kit"
  url "https://github.com/Skyline-23/conductor-kit/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "ab4e0dda9d32e80186fb329d8a4e9c2eb1935041eb78ed352fd3eefb80b44e36"
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
