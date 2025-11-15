class NcspotController < Formula
  desc "simple prgramme to wrap and control ncspot's unix socket easy integration with other apps like sketchybar"
  homepage "https://github.com/Kainoa-h/ncspot-controller"
  url "https://github.com/Kainoa-h/ncspot-controller/releases/download/v1.0.0/ncspot-controller-v1.0.0-macos-aarch64.tar.gz"
  sha256 "6683a742e315f1bd0cca7073b5c11c780ccf78864283ab961c79d01b8b10ffc5"
  license ""

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
