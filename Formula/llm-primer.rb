class LlmPrimer < Formula
  desc "Pre-warmed pool of Claude Code sessions — skip the startup wait"
  homepage "https://github.com/asakin/llm-primer"
  url "https://github.com/asakin/llm-primer/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5b0804e8ef88ac3570a305d67af5f45bf141e7f21ac9a3d03bf1d262deb22242"
  license "MIT"
  version "0.1.0"

  depends_on "tmux"

  def install
    bin.install "bin/primer"
    bin.install "bin/primerd"
  end

  def caveats
    <<~EOS
      Quick start:
        primer start    # start the pool daemon
        primer          # attach to a warm Claude Code session

      Configuration (optional):
        echo 'PRIMER_CLI=claude'      > ~/.llm-primer/config
        echo 'PRIMER_POOL_SIZE=2'    >> ~/.llm-primer/config

      See the README for full details:
        https://github.com/asakin/llm-primer
    EOS
  end

  test do
    system "#{bin}/primer", "help"
  end
end
