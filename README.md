## SLADE with Homebrew
Install [SLADE](http://slade.mancubus.net/) Doom Editor with [Homebrew](http://brew.sh/).

### Prerequisites

This guide assumes that you are using the recent version of **OS X**, like **Mavericks** or **Yosemite**. Particular combination of older versions of OS and development tools may require additional actions.  
The earliest supported version of **OS X** is **Lion**.  
For instance, some versions of **Xcode** don't install **Command Line Tools** by default. You need to configure it by hand.

### How to install

Start from the fourth step if you already have **Homebrew** installed. But first, check the [important note](#important-note-for-homebrew-users) below.

1. Install **Xcode** from **Mac App Store**. If you have a developer account, you can also install it from [Apple Developer](https://developer.apple.com/downloads/) website.
2. Start **Xcode**, accept its license agreement and enter your password to finalize the installation process.
3. Install **Homebrew**. It's likely that you need to enter your password once again.
4. Start **Terminal.app**.
5. Execute `brew doctor` command to verify **Homebrew** operation. It should output something like `Your system is ready to brew.` If it's not the case, carefully read messages and follow proposed actions.
6. Execute `brew tap alexey-lysiuk/slade` command to add **SLADE** formula.
7. Execute `brew install --HEAD slade` command to install **SLADE**. This step will take a while.
8. Execute `brew linkapps slade` command to add **SLADE** to Applications folder.
9. Start **SLADE** from the Launchpad or directly from Applications folder.

### How to update

1. Start **Terminal.app**.
2. Execute `brew update` command to update **Homebrew** to the latest version.
3. Execute `brew upgrade slade` command to update **SLADE** to the latest version.

### Wait, I want to debug!

Just a warning: _You must have some experience with **Xcode** and programming in general to do so_.

1. Complete all installation steps.
2. Clone **SLADE** [repository](https://github.com/sirjuddington/SLADE) using your favorite Git client or simply from the command line: `cd && git clone https://github.com/sirjuddington/SLADE.git`.
3. Generate **XCode** project using **CMake.app**. Use **~/SLADE** as a source code path, and **~/SLADE/release** as a binaries path. Press **Configure** button, wait for process to finish, then press **Generate** button. If you don't have **CMake.app** installed, use `cd SLADE && mkdir release && cd release && cmake -GXcode ..` command.
4. Open **XCode** project located in **SLADE/release** folder, from the **Finder** or by using `open SLADE.xcodeproj` command.
5. Build and run **SLADE** by pressing `Command + R`.

Next time, when you want to grab the latest **SLADE** source code, do the following:

1. Pull from **SLADE** repository using your favorite Git client or use `cd ~/SLADE && git pull` command.
2. Update **XCode** project using **CMake.app**, i.e. press **Configure**, wait, press **Generate**. Or from the command line: `cd release && cmake -GXcode ..`.
3. Open **XCode** project and run as usual.

### Important note for Homebrew users

At the moment of writting, [wxWidgets](https://www.wxwidgets.org/) formula cannot be used to build **SLADE**. Use `brew info wxmac` command to check the status of **wxWidgets**. If it's installed, you need to execute `brew unlink wxmac` command, because **SLADE** installation will fail otherwise. Hopefully, this will be fixed with the next release of **wxWidgets**.

### Links

* [SLADE Website](http://slade.mancubus.net/)
* [SLADE Git Repository and Issues Tracker](https://github.com/sirjuddington/SLADE)
* [Apple Developer Website](https://developer.apple.com/)
* [Homebrew Website](http://brew.sh/)
* [Homebrew Git Repository and Issues Tracker](https://github.com/Homebrew/homebrew)
* [CMake Website](http://www.cmake.org/)
