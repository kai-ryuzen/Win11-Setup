# fsos-toolkit-notes.md

# FSOS-X Dash Toolkit | Version R6
## Preset Profile Scope: Forza / Easy Anti-Cheat Optimized Windows 11 Tweak Set

### 1. General Toggle Tweaks
- Disabled redundant preloaded UWP bloat apps via FSOS uninstaller
- Tweaked Windows built-in features:
  - Game Bar, Fault Tolerant Heap disabled
  - Modern Standby Fix enabled (S0 sleep disabled, avoid idle performance drops)
  - SysMain(Superfetch), Hibernation disabled for SSD performance & extra RAM
  - NTFS Last-Access Updates, Automatic Maintenance disabled to reduce unnecessary disk I/O
  - Memory Compression kept enabled for idle RAM management
  - Auto-reboot after BSOD disabled to read crash dump on system failure

### 2. GPU & Display Tweaks
- Fullscreen Optimizations OFF (true exclusive fullscreen to cut input lag)
- Variable Refresh Rate ON (FreeSync support in borderless/windowed game mode)
- MPO(Multiplane Overlay) OFF to eliminate Win11 24H2 flicker/stutter
- HW Accelerated GPU Scheduling ON, Extended GPU TDR Timeout ON to prevent false GPU crash

### 3. Network Stack Tweaks (Low game latency, no download speed penalty)
- Disabled: NDU, NetBIOS over TCP/IP, LLMNR, Network Throttling Index, Nagle Algorithm, NIC Power Saving, QoS Reserved Bandwidth
- Enabled: Disabled Delayed ACK(TCP ACK Frequency), BBR2 Congestion Provider, Fast UDP Datagram Send
- TCP Receive Window Auto-Tuning OFF, RSC kept ON for stable Wi‑Fi latency

### 4. Security Tweaks (Anti-Cheat Safe | Performance Focused)
- Core Isolation(Memory Integrity) & VBS fully disabled for large CPU/RAM performance gain
- SmartScreen disabled to remove background download/URL scanning overhead
- CPU Mitigations, Vulnerable Driver Blocklist, Control Flow Guard retained ON (mandatory for EasyAC/Vanguard compatibility, prevents game ban/crash)
- UAC already disabled via preset

### Additional Notes
- All tweaks validated compatible with Easy Anti-Cheat / Forza Motorsport online; no core security modules removed that trigger anti-cheat enforcement.
- Preset paired with debloated NVCleanstall NVIDIA driver install (separate doc).
```
