class Aux4 < Formula
  desc 'elevate your imagination'
  homepage 'https://aux4.io'
  version '5.0.1'

  os_cpu_map = {
    'mac_intel' => {
      file_name: 'aux4-darwin-amd64',
      url: "https://github.com/aux4/aux4/releases/download/v#{version}/aux4-darwin-amd64",
      sha256: '6a687bafcd84ef07544813a5dbe6f58c716b724a7e012a905367f68adea0a5de'
    },
    'mac_arm' => {
      file_name: 'aux4-darwin-arm64',
      url: "https://github.com/aux4/aux4/releases/download/v#{version}/aux4-darwin-arm64",
      sha256: 'd7e88995dbc4821be8291c0b36536a055b83eaaa3c6a0ffd302ce9311a181719'
    },
    'linux_intel' => {
      file_name: 'aux4-linux-amd64',
      url: "https://github.com/aux4/aux4/releases/download/v#{version}/aux4-linux-amd64",
      sha256: '8eb40dcfa33e311e8c64a91f3deec01e840e21bfb4e295fcd5a77c0781e29b9c'
    },
    'linux_32bit' => {
      file_name: 'aux4-linux-386',
      url: "https://github.com/aux4/aux4/releases/download/v#{version}/aux4-linux-386",
      sha256: '60ccb24a16b4fc990be06fa59eac9be329e0a7340e45a59b138f01658d847da5'
    },
    'windows_intel' => {
      file_name: 'aux4-windows-amd64.exe',
      url: "https://github.com/aux4/aux4/releases/download/v#{version}/aux4-windows-amd64.exe",
      sha256: '58f4ebe0eeff8797020203eda5abfeab3a001d1a80bd0e08e3eab63ea2c18188'
    },
    'windows_32bit' => {
      file_name: 'aux4-windows-386.exe',
      url: "https://github.com/aux4/aux4/releases/download/v#{version}/aux4-windows-386.exe",
      sha256: '0a354f5493170e2d7e71620a2ec04626c2c1350d6be6d9f21bcbeb2ce622ce9b'
    }
  }

  def self.os_cpu_key
    if OS.mac?
      Hardware::CPU.arm? ? 'mac_arm' : 'mac_intel'
    elsif OS.linux?
      Hardware::CPU.is_32_bit? ? 'linux_32bit' : 'linux_intel'
    elsif OS.windows?
      Hardware::CPU.is_32_bit? ? 'windows_32bit' : 'windows_intel'
    else
      raise 'Unsupported platform'
    end
  end

  current_config = os_cpu_map[Aux4.os_cpu_key]
  url current_config[:url]
  sha256 current_config[:sha256]
  license 'Apache-2.0'

  def install
    local_file = Aux4.os_cpu_map[os_cpu_key][:file_name]

    if OS.windows?
      bin.install local_file => 'aux4.exe'
    else
      bin.install local_file => 'aux4'
    end
  end

  test do
    if OS.windows?
      system "#{bin}/aux4.exe"
    else
      system "#{bin}/aux4"
    end
  end
end
