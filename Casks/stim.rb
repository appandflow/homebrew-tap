cask "stim" do
  version "0.1.1"
  sha256 "30dd2c697e59bd38fcf9ee635e418d3536c0e7f0ac390974a0af68b3c8c06002"

  url "https://github.com/appandflow/stim/releases/download/desktop-v#{version}/Stim-#{version}.dmg"
  name "Stim"
  desc "Watch and control the simulators and emulators Stim runs"
  homepage "https://stim.appandflow.com/"

  livecheck do
    url "https://github.com/appandflow/stim/releases/download/desktop-latest/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: ">= :sonoma"

  app "Stim.app"

  zap trash: "~/Library/Preferences/dev.stim.desktop.plist"
end
