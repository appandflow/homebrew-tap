cask "stim" do
  version "0.2.13"
  sha256 "e3437e66b8c9b37bcc251b1f95742565b17ff9839cccd68f2d864155b3458c84"

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
