class Dsc < Formula
  desc "Microsoft Desired State Configuration v3"
  homepage "https://github.com/PowerShell/DSC"
  version "3.0.0-preview.9"

  if Hardware::CPU.intel?
    sha256 "fc3aaa3f0a36f48d220726895bbf8a3375c43a926df3d3c57be873313846eeef"
    url "https://github.com/PowerShell/DSC/releases/download/v3.0.0-preview.8/DSC-3.0.0-preview.8-x86_64-apple-darwin.tar.gz"
  elsif Hardware::CPU.arm?
    sha256 "f3658ee242da84d7f1687d91ef82c7b0579f0a74c54a2f4a0159758db4e3e4c6"
    url "https://github.com/PowerShell/DSC/releases/download/v3.0.0-preview.9/DSC-3.0.0-preview.9-aarch64-apple-darwin.tar.gz"
  end

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
