---
# TypeWriterOS

**TypeWriterOS** is a minimalist Linux distribution designed for writers. It transforms your computer into a distraction-free, digital typewriter, offering a focused environment to write and manage text files effortlessly.

---

## Features

- **Lightweight Desktop Environment**: Powered by LXQt, optimized for speed and simplicity.
- **Instant Boot to Writing**: Boots directly into a full-screen text editor, ready for work.
- **File Slot System**: Quickly switch between 12 pre-configured text files using function keys (F1–F12).
- **Simple File Export**: Press F12 to copy all text files to a connected USB drive.
- **Minimalist Environment**: Stripped-down interface with no unnecessary distractions.
- **Autosave & Backup**: Files are automatically saved with optional version control.

---

## System Requirements

- **Processor**: x86_64 or ARM-based CPU
- **Memory**: 512MB RAM (1GB recommended)
- **Storage**: 2GB of available disk space
- **Optional**: USB drive for file export

---

## Installation

### Prerequisites
- A USB flash drive (minimum 4GB) for the installer.
- A target device compatible with the system requirements.

### Steps
1. Clone or download the repository:
   ```bash
   git clone https://github.com/YourUsername/TypeWriterOS.git
   cd TypeWriterOS
   ```
2. Flash the ISO to a USB drive:
   - On Linux:
     ```bash
     sudo dd if=TypeWriterOS.iso of=/dev/sdX bs=4M status=progress
     sync
     ```
   - On Windows: Use [Rufus](https://rufus.ie/).
3. Boot the target device from the USB and follow the on-screen instructions.
4. After installation, run the setup script:
   ```bash
   sudo ./installer.sh
   ```

---

## Usage

### Writing Workflow
- **Boot**: Power on the device, and FeatherPad opens automatically.
- **File Switching**: Use function keys (F1–F12) to open 12 pre-configured files:
  - F1 = file1.txt
  - F2 = file2.txt
  - ...
  - F11 = file11.txt
- **Export Files**:
  1. Insert a USB drive.
  2. Press **F12** to copy all files to the drive.
  3. Remove the USB drive after export is complete.
- **Shutdown**: Turn off the system once your work is done.

---

## Development and Customization

### File Slot Customization
The file paths for F1–F12 are configured in `.xbindkeysrc`. To modify:
```bash
nano /home/writer/.xbindkeysrc
```

### Adding Features
- Modify the `installer.sh` script to add or adjust features.
- Include additional applications by updating the package installation list.

---

## Contributing
Contributions are welcome! Fork the repository and submit a pull request with your enhancements or fixes.

---

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Screenshots
*(Screenshots coming soon!)*

---

Enjoy distraction-free writing with **TypeWriterOS**!
```
