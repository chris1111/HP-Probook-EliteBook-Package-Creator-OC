This is a tool that lets you use MacBook Pro Retina's highest and unsupported resolutions.
As an example, a Retina MacBook Pro 13" can be set to 3360×2100 maximum resolution, as
opposed to Apple's max supported 1680×1050. It is accessible from the menu bar.

![rdm-screenshot](etc/screenshot.png)

You should prefer resolutions marked with ⚡️ (lightning), which indicates the resolution
is HiDPI or 2× or more dense in pixels.

For more practical results, add RDM.app to your Login Items in **System Preferences ➡ Users & Groups ➡ Login Items**.
This way RDM will run automatically on startup.

This version has integrated generator/editor of display override plist (see https://comsysto.github.io/Display-Override-PropertyList-File-Parser-and-Generator-with-HiDPI-Support-For-Scaled-Resolutions/), which allows to add custom scaled resolutions. **Now you just have to specify the resolution you want, not the twice of it.** For example, in the previous versions (~`2.3.3`), you should have to specify 3840×2160 resolution with HiDPI box checked, to achieve a 1920×1080 resolution with HiDPI support. Now, you only need to add a 1920×1080 resolution with HiDPI box checked.

To install this application, simply run `./install` in the project root directory. If you want to specify the installation path, set `$RDM_PATH` variable. The default installation path is `/Applications`.
To uninstall this application, simply run `./uninstall`. The `$RDM_PATH` variable works just the same way as in the install script.

This is a fork of https://github.com/avibrazil/RDM.

Code for toggling display mirroring is taken from https://github.com/fcanas/mirror-displays.

Requires macOS 10.10 or higher for running, Xcode 10 for building. For older systems use the original version.
Tested in macOS 10.15.6 with Xcode 11.4.
