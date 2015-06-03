## SLADE with Homebrew
Install [SLADE](http://slade.mancubus.net/) Doom Editor with [Homebrew](http://brew.sh/).

### How to install

Start from the fourth step if you already have **Homebrew** installed. But first, check the [important note][#important-note-for-homebrew-users] below.

1. Install **Xcode** from **Mac App Store**. If you have a developer account, you can also install it from [Apple Developer](https://developer.apple.com/downloads/) website.
2. Start **Xcode**, accept its license agreement and enter your password to finalize the installation process.
3. Install **Homebrew**. It's likely that you need to enter your password once again.
4. Start **Terminal.app**.
5. Execute `brew doctor` command to verify **Homebrew** operation. It should output something like `Your system is ready to brew.` If it's not the case, carefully read messages and follow proposed actions.
6. Execute `brew tap alexey-lysiuk/slade` command to add **SLADE** formula.
7. Execute `brew install --HEAD slade` command to install **SLADE**. This step will take a while.
8. Execute `brew linkapps slade` command to add **SLADE** to Applications folder.
9. Start **SLADE** from the Launchpad or directly from Applications folder.

### Important note for Homebrew users

At the moment of writting, [wxWidgets](https://www.wxwidgets.org/) formula cannot be used to build **SLADE**. Use `brew info wxmac` command to check the status of **wxWidgets**. If it's installed, you need to execute `brew unlink wxmac` command, because **SLADE** installation will fail otherwise. Hopefully, this will be fixed with the next release of **wxWidgets**.

### How to update

1. Start **Terminal.app**.
2. Execute `brew update` command to update **Homebrew** to the latest version.
3. Execute `brew upgrade slade` command to update **SLADE** to the latest version.
