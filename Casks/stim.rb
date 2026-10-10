cask "stim" do
  version "0.1.20"
  sha256 "7584f3cf6c76a2d8a1b40efdf42b14da840187105c427f5b19ae864373369a6e"

  url "https://github.com/appandflow/stim/releases/download/desktop-v#{version}/Stim-#{version}.dmg"
  name "Stim"
  desc "Watch and control the simulators and emulators Stim runs"
  homepage "https://stim.appandflow.com/"

  livecheck do
    url "https://github.com/appandflow/stim/releases/download/desktop-latest/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Stim.app"

  zap trash: [
    "~/Library/Application Support/dev.stim.desktop",
    "~/Library/Application Support/Stim Desktop",
    "~/Library/Caches/dev.stim.desktop",
    "~/Library/HTTPStorages/dev.stim.desktop",
    "~/Library/Preferences/dev.stim.desktop.plist",
    "~/Library/Saved Application State/dev.stim.desktop.savedState",
  ]

  caveats <<~EOS
    Stim Desktop needs the stim command line tool:
      npm install --global stim
  EOS
end
