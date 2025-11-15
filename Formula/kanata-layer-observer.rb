class KanataLayerObserver < Formula
  desc "Simple tcp client that triggers a shell script when kanata switches layers"
  homepage "https://github.com/Kainoa-h/kanata-layer-observer"
  url "https://github.com/Kainoa-h/kanata-layer-observer/releases/download/untagged-ca9036fbb01ce7c2b381/kanata-layer-observer-v1.0.0-macos-aarch64.tar.gz"
  version "1.0.0"
  sha256 "bcbceedb11665e50e7716845f3a38496057becafd5c35979012de3470267cc08"
  license "LGPL-3.0-or-later"

  # Only works on Apple Silicon Macs
  depends_on arch: :arm64

  def install
    bin.install "kanata-layer-observer"
  end


  service do
    run opt_bin/"kanata-layer-observer"
    keep_alive true
    log_path var/"log/kanata-layer-observer.log"
    error_log_path var/"log/kanata-layer-observer.err"
    working_dir HOMEBREW_PREFIX
    environment_variables PATH: std_service_path_env
  end
end

