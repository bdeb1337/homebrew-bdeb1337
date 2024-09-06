class Dsc < Formula
  name "Desired State Configuration v3"
  name "dscv3"
  desc "Microsoft Desired State Configuration v3"
  homepage "https://github.com/PowerShell/DSC"
  version "3.0.0-preview.8"

  arch = Hardware::CPU.intel? ? "x86_64-apple-darwin" : "aarch64-apple-darwin"

  if Hardware::CPU.intel?
    # x86_64 sha256
    sha256 "fc3aaa3f0a36f48d220726895bbf8a3375c43a926df3d3c57be873313846eeef"
  else
    # arm64 sha256
    sha256 "02378b85bde208238acc55290ef5b1aa3b5ca884ad514d7a6bc01334c287274c"
  end

  url "https://github.com/PowerShell/DSC/releases/download/v#{version}/DSC-#{version}-#{arch}.tar.gz"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+(?:-\w+(?:\.\w+)*)?)$/i)
  end

  def install
    prefix.install Dir["*"]
    # Create a wrapper script
    (bin/"dsc").write <<~EOS
      #!/bin/bash
      cd #{prefix} && ./dsc "$@"
    EOS
    (bin/"dsc").chmod 0755
  end
end
