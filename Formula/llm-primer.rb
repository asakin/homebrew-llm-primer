class LlmPrimer < Formula
  desc "Pre-warmed pool of Claude Code sessions — skip the startup wait"
  homepage "https://github.com/asakin/llm-primer"
  url "https://github.com/asakin/llm-primer/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "0528577aa6cb2be3c21855d4bfe7b8d74c31337e8bedf90f3420ced3b2834ce0"
  license "MIT"
  version "0.2.2"

  depends_on "tmux"

  def install
    bin.install "bin/primer"
    bin.install "bin/primerd"
    bin.install "bin/primer-log-filter"
  end

  def caveats
    <<~EOS
      Quick start:
        primer start    # start the pool daemon
        primer          # attach to a warm Claude Code session

      Configuration (optional):
        echo 'PRIMER_CLI=claude'      > ~/.llm-primer/config
        echo 'PRIMER_POOL_SIZE=2'    >> ~/.llm-primer/config

      Hold mode (v0.2) — skip warmup, hold live Claude sessions:
        PRIMER_HOLD=1
        PRIMER_SLOTS=claude|claude --agent writer|claude --agent engineer

      Opt-in session logging (DEBUG MODE, off by default):
        PRIMER_LOG_FILTER=primer-log-filter

      See the README for full details:
        https://github.com/asakin/llm-primer
    EOS
  end

  test do
    system "#{bin}/primer", "help"
  end
end
