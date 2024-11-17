# TypeWriterOS: Minimalist Writing-Focused Linux Distro

**TypeWriterOS** is a lightweight, distraction-free Linux distribution designed for writers. It turns your computer into a digital typewriter, offering a focused environment to write without the clutter of a desktop environment.

---

## Key Features
- **Instant Boot to Writing**: Automatically logs in and opens the text editor where you left off.
- **File Slot System**: Easily switch between 12 text files using function keys (F1–F12).
- **Simple File Export**: Transfer files to USB drives with a single keystroke (F12).
- **Minimalist Environment**: No desktop environment or unnecessary distractions.

---

## How It Works
1. **Boot**: Power on the device, and the text editor opens directly.
2. **Write**: Use function keys to switch between files (F1–F12).
3. **Export**: Insert a USB drive and press F12 to copy all files to the drive.
4. **Shutdown**: Turn off the device when done—no fuss, no distractions.

---

## System Requirements
- CPU: x86_64 or ARM processor
- RAM: 512MB (1GB recommended)
- Storage: 2GB available disk space
- Optional: USB drive for file export

---

## Installation Instructions

### 1. Install TypeWriterOS
1. Download the **TypeWriterOS ISO** (link coming soon).
2. Flash the ISO to a USB drive:
   - On Linux:  
     ```bash
     sudo dd if=TypeWriterOS.iso of=/dev/sdX bs=4M status=progress
     sync
     ```
   - On Windows: Use [Rufus](https://rufus.ie/).
3. Boot from the USB drive and follow the installation instructions.

---

## Usage Guide

### Boot and Write
- The system automatically logs in and opens the text editor.
- Begin writing in the last file you worked on.

### File Slot System
- Use function keys **F1–F12** to open 12 different files:
  - F1 = Slot 1 (file1.txt)
  - F2 = Slot 2 (file2.txt)
  - ...
  - F12 = Slot 12 (file12.txt)

### Export Files
1. Insert a USB drive.
2. Press **F12** to copy all files (`file1.txt` to `file12.txt`) to the USB drive.
3. Remove the USB after the export completes.

---

## Contributing
Want to contribute or improve TypeWriterOS? Fork the project repository (link coming soon) or share your feedback.

---

## License
TypeWriterOS is released under the MIT License. Feel free to modify and share it as you like.

---

Enjoy distraction-free writing with **TypeWriterOS**!
