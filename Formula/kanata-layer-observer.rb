class KanataLayerObserver < Formula
  desc "Simple tcp client that triggers a shell script when kanata switches layers"
  homepage "https://github.com/Kainoa-h/kanata-layer-observer"
  url "https://github.com/Kainoa-h/kanata-layer-observer/releases/download/v1.0.0/kanata_layer_observer-v1.0.0-macos-aarch64.tar.gz"
  version "1.0.0"
  sha256 "7447b1e85d4fb8f130a994625a3eb29bc377cbfdeea329f862ad9169a268e329"
  license "LGPL-3.0-or-later"

  # Only works on Apple Silicon Macs
  depends_on arch: :arm64

  def install
    bin.install "kanata_layer_observer"
  end


  service do
    run opt_bin/"kanata_layer_observer"
    keep_alive true
    log_path var/"log/kanata-layer-observer.log"
    error_log_path var/"log/kanata-layer-observer.err"
    working_dir HOMEBREW_PREFIX
    environment_variables PATH: std_service_path_env
  end
end

