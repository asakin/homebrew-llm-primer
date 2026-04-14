class LlmPrimer < Formula
  desc "Pre-warmed LLM CLI sessions in tmux — Claude, Aider, Ollama, etc."
  homepage "https://github.com/asakin/llm-primer"
  url "https://github.com/asakin/llm-primer/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "REPLACE_AFTER_TAGGING_v0.5.0"
  license "MIT"
  version "0.5.0"

  depends_on "tmux"

  def install
    bin.install "bin/primer"
    bin.install "bin/primerd"
    bin.install "bin/primer-gc"
    bin.install "bin/primer-selftest"
  end

  def caveats
    <<~EOS
      llm-primer works with any LLM CLI — set PRIMER_CLI in ~/.llm-primer/config.

      Quick start:
        primerd config-template > ~/.llm-primer/config   # generate a starter config
        primerd start                                    # start the pool daemon
        primer attach                                    # attach to a warm session

      Configure an alt slot (different model or tool):
        Edit ~/.llm-primer/config, set PRIMER_ALT_CLI, then:
        primer alt

      Verify the install:
        primer selftest --fast

      Optional shell aliases:
        alias cc='primer attach'
        alias ca='primer alt'
    EOS
  end

  test do
    # Runs the full tmux-free test suite: config parsing, alt slot resolution,
    # CLI wiring, GC stray/lint, help outputs. No LLM API calls, no real pool.
    system "#{bin}/primer-selftest", "--fast"
  end
end
