class NcspotController < Formula
  desc "simple prgramme to wrap and control ncspot's unix socket easy integration with other apps like sketchybar"
  homepage "https://github.com/Kainoa-h/ncspot-controller"
  url "https://github.com/Kainoa-h/ncspot-controller/releases/download/v1.0.1/ncspot-controller-v1.0.1-macos-aarch64.tar.gz"
  sha256 "84e366539bafbd528807595892dad836d98219361fa5bcaced6718ad264ca244"
  version "1.0.1"
  license "GPL-3.0"

  depends_on arch: :arm64

  def install
    bin.install "ncspot-controller"
  end

  service do
    run opt_bin/"ncspot-controller"
    keep_alive true
    log_path var/"log/ncspot-controller.log"
    error_log_path var/"log/ncspot-controller.err"
    working_dir HOMEBREW_PREFIX
    environment_variables PATH: std_service_path_env
  end
end
