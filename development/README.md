# Minimal Pluto Plus development platform

Toolchain: Vivado 2019.1 and Xilinx SDK 2019.1.

Changes:
- Pluto Plus board support.
- FPGA interpolation and decimation FIR blocks removed.
- Both RX/TX channels and DMA paths retained.

Implemented resources:
- LUTs: 10,817 / 17,600
- Registers: 17,407 / 35,200
- DSP48: 28 / 80
- BRAM tiles: 2 / 60

Specified timing constraints pass.
External interface timing and IQ playback require hardware validation.
PetaLinux integration and SD boot are not yet completed.

## Restore source changes

After cloning this repository:

    git submodule update --init --recursive
    ./development/apply.sh

The development patches already contain the original Pluto Plus patches.
Do not separately apply patches/*.diff.
