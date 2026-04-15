class LlmPrimer < Formula
  desc "Pre-warmed pool of Claude Code sessions — skip the startup wait"
  homepage "https://github.com/asakin/llm-primer"
  url "https://github.com/asakin/llm-primer/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6912cc01878f1d44c48701ad2fef54edd150d76edcd88bc143e9d91df82df65e"
  license "MIT"
  version "0.1.1"

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
