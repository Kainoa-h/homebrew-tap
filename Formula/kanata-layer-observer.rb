class KanataLayerObserver < Formula
  desc "Simple tcp client that triggers a shell script when kanata switches layers"
  homepage "https://github.com/Kainoa-h/kanata-layer-observer"
  url "https://github.com/Kainoa-h/kanata-layer-observer/releases/download/v2.1.0/kanata-layer-observer-v2.1.0-macos-aarch64.tar.gz"
  version "2.1.0"
  sha256 "9518efd59582f0d08022fbad76d25585d3ad454efdb678266e13dd70cf809631"
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

