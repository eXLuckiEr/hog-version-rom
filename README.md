# HoG Version ROM (hog-version-rom)

An AXI4-Lite IP core for Xilinx Zynq-7000 SoC that exposes the build-time version and identity metadata of a [HoG (HDL-on-git)](https://github.com/Hog-CERN/Hog) hardware build to software running on the ARM (PS) side.

The core acts as a memory-mapped read-only register block: every register is driven directly by signals that the HoG flow injects at synthesis time (build date, commit SHA-1, per-module version tags, project flavour, and the Zynq device DNA). No write logic is implemented -- the software side only ever performs 32-bit reads against the mapped address range.

## Purpose

When a HoG-generated RTL design is built and deployed, there is no built-in way for the Linux userspace (or bare-metal) software to find out *exactly* which hardware build is running on the board. Mismatches between the PL bitstream and the PS image (kernel, device tree, drivers) are a frequent source of hard-to-debug integration problems.

This IP closes that gap by:

- Exposing the **global HoG build metadata** (date, time, version, SHA-1) as readable registers.
- Exposing **per-module provenance** -- the version tag and SHA-1 of the top-level module, the constraint set, the HoG library, any IP-bus XML, and up to two project-specific source lists.
- Exposing the **project flavour** tag.
- Exposing the **57-bit Zynq device DNA** (read out via the Xilinx `DNA_PORT` primitive at power-on), which allows the OS to positively identify the physical board and cross-check it against the expected build.

A small Linux driver or a bare-metal routine can then query the hardware at boot time and compare the reported values against the manifest of the software image currently in use.

## Register map

All registers are 32-bit wide, little-endian, and **read-only**. Offsets are relative to the base address of the AXI slave interface (`S00_AXI`).

| Offset  | Name       | Width | Description                                                        |
|---------|------------|-------|--------------------------------------------------------------------|
| 0x000   | `global_date`  | 32 bit | Build date, as encoded by the HoG flow                             |
| 0x004   | `global_time`  | 32 bit | Build time, as encoded by the HoG flow                             |
| 0x008   | `global_ver`   | 32 bit | Global HoG version tag                                             |
| 0x00C   | `global_sha`   | 32 bit | Low 32 bits of the global build SHA-1                              |
| 0x010   | `top_sha`      | 32 bit | Low 32 bits of the top-level module SHA-1                          |
| 0x014   | `top_ver`      | 32 bit | Top-level module version tag                                       |
| 0x018   | `con_sha`      | 32 bit | Low 32 bits of the constraint (XDC) SHA-1                          |
| 0x01C   | `con_ver`      | 32 bit | Constraint set version tag                                         |
| 0x020   | `hog_sha`      | 32 bit | Low 32 bits of the HoG library SHA-1                               |
| 0x024   | `hog_ver`      | 32 bit | HoG library version tag                                            |
| 0x028   | `xml_sha`      | 32 bit | Low 32 bits of the IP-bus XML SHA-1 (0 if not present)            |
| 0x02C   | `xml_ver`      | 32 bit | IP-bus XML version tag (0 if not present)                         |
| 0x030   | `mylib0_ver`   | 32 bit | Version tag of project source list 0                               |
| 0x034   | `mylib0_sha`   | 32 bit | Low 32 bits of project source list 0 SHA-1                        |
| 0x038   | `mylib1_ver`   | 32 bit | Version tag of project source list 1                               |
| 0x03C   | `mylib1_sha`   | 32 bit | Low 32 bits of project source list 1 SHA-1                        |
| 0x040   | `myextlib_sha` | 32 bit | Low 32 bits of the external library SHA-1 (0 if not present)      |
| 0x044   | `flavour`      | 32 bit | Project flavour tag                                                |
| 0x048   | `device_dna_lo`| 32 bit | Low 32 bits of the Zynq device DNA                                 |
| 0x04C   | `device_dna_hi`| 32 bit | High 32 bits of the Zynq device DNA                                |

> **Note on SHA-1 registers.** The full 160-bit SHA-1 of each object is not stored in the register file; only the low 32 bits are exposed. This is a deliberate size/area trade-off. Combined with the version tag and the device DNA, 32 bits provide a practical fingerprint for build-identity verification in a Zynq context. If your verification flow requires the full digest, extend the register map and the HoG signal injection accordingly.

### Device DNA

The 57-bit DNA value is read out of the Xilinx `DNA_PORT` primitive during power-on (a 59-cycle shift sequence on `S_AXI_ACLK`) and latched into the `device_dna_lo` / `device_dna_hi` register pair. In simulation the primitive returns the value of the `SIM_DNA_VALUE` local parameter (default `57'hDEAD_BEEF`), so the DNA registers will read as that value in a simulator.

## Parameters and ports

### Parameters

| Parameter              | Default | Description                              |
|------------------------|---------|------------------------------------------|
| `C_S_AXI_DATA_WIDTH`   | 32      | Width of the AXI4-Lite data bus          |
| `C_S_AXI_ADDR_WIDTH`   | 7       | Width of the AXI4-Lite address bus       |

### User input ports (HoG-injected, read-only)

All user ports are 32-bit inputs that the HoG flow drives with the corresponding build metadata. See the register map above for the meaning of each.

- `global_date`, `global_time`, `global_ver`, `global_sha`
- `top_sha`, `top_ver`
- `con_sha`, `con_ver`
- `hog_sha`, `hog_ver`
- `xml_sha`, `xml_ver` (optional)
- `mylib0_ver`, `mylib0_sha`, `mylib1_ver`, `mylib1_sha`
- `myextlib_sha` (optional)
- `flavour`

The remaining ports form a standard single-channel AXI4-Lite slave interface (`S_AXI_ACLK`, `S_AXI_ARESETN`, and the AW/W/B/AR/R channels).

## Driver

A minimal Xilinx C driver is provided under `drivers/hog_version_rom_v1_0/`:

- `src/hog_version_rom.h` -- register offset macros (`HOG_VERSION_ROM_S00_AXI_SLV_REG0_OFFSET` .. `REG17_OFFSET`), read/write inline helpers, and the self-test prototype.
- `src/hog_version_rom.c` -- compiled driver source.
- `src/hog_version_rom_selftest.c` -- a basic write-then-read-back self-test routine (note: the core is read-only in production use; the self-test follows the standard Vivado template).
- `data/hog_version_rom.mdd` -- Vivado driver metadata.

> **Known limitation.** The driver header currently only defines offsets up to `REG17` (offset `0x044`), which is sufficient for `flavour`. The two device-DNA registers at offsets `0x048` and `0x04C` are **not yet covered** by the generated offsets. Until the driver is regenerated or the header is extended, read the DNA registers directly with `Xil_In32(base + 0x48)` and `Xil_In32(base + 0x4C)`.

## Requirements

- Xilinx Zynq-7000 SoC (any variant; the `DNA_PORT` primitive is Zynq-specific).
- Vivado for IP integration.
- A HoG (HDL-on-git) build flow that can drive the user input ports with build metadata.
- AXI4-Lite interconnect between the Zynq PS (ARM) and the PL where this core is instantiated.

## Directory structure

```
hog-version-rom/
|-- hdl/                          RTL source
|   |-- hog_version_rom_v1_0.v    Top-level IP wrapper
|   `-- hog_version_rom_slave_lite_v1_0_S00_AXI.v   AXI4-Lite slave + register file
|-- drivers/                      Xilinx C driver
|   `-- hog_version_rom_v1_0/
|       |-- data/                 Driver metadata (.mdd, .tcl)
|       `-- src/                  C source, headers, Makefile
|-- hw_handoff/                   Vivado-generated handoff files
`-- README.md
```

## Examples

<!-- TODO: Add usage examples below. Suggested topics:
  - Reading all version registers from Linux userspace (mmap / devmem2)
  - A bare-metal C routine that prints the full build identity
  - Integrating the IP into a Vivado project and connecting the HoG signals
  - Cross-checking hardware identity against a software manifest at boot
-->

## License

Distributed under the Apache License, Version 2.0.
