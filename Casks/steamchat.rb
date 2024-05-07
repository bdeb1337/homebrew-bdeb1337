cask "steamchat" do
  version "0.1.1"
  sha256 "81a4be1db1dad86f89f75068d640bb76886b1d0a305011aa5179558725033fc2"

  url "https://github.com/bdeb1337/steamchat/releases/download/v#{version}/steamchat-#{version}.dmg"
  name "steamchat"
  desc "Electron-based web wrapper for Steam Chat"
  homepage "https://github.com/bdeb1337/steamchat"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "steamchat.app"

  zap trash: [
    "~/Library/Application Support/steamchat",
  ]
end

