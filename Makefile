# ==============================
# Verilog course Makefile
# ==============================

# Simulator
IVERILOG = iverilog
VVP      = vvp
GTKWAVE  = gtkwave

# Directories
RTL_DIR = rtl
TB_DIR  = tb
BUILD   = build
WAVE    = waves

# Top testbench
TOP = tb_top

# Output files
SIM_OUT = $(BUILD)/sim.out
VCD     = $(WAVE)/dump.vcd

# Source discovery
RTL_SRC = $(wildcard $(RTL_DIR)/*.v)
TB_SRC  = $(wildcard $(TB_DIR)/*.v)

SRC = $(RTL_SRC) $(TB_SRC)

# Default target
all: run

# ==============================
# Build simulation
# ==============================
$(SIM_OUT): $(SRC)
	@mkdir -p $(BUILD)
	$(IVERILOG) -g2012 -o $(SIM_OUT) -s $(TOP) $(SRC)

# ==============================
# Run simulation
# ==============================
run: $(SIM_OUT)
	@mkdir -p $(WAVE)
	$(VVP) $(SIM_OUT)

# ==============================
# Open waveform
# ==============================
wave:
	$(GTKWAVE) $(VCD)

# ==============================
# Headless waveform check (CI)
# ==============================
check: run
	@test -f $(VCD) && echo "Waveform generated OK"

# ==============================
# Clean
# ==============================
clean:
	rm -rf $(BUILD) $(WAVE)

# ==============================
# Deep clean
# ==============================
distclean: clean
	rm -f *.hex *.mem *.out

# ==============================
# Help
# ==============================
help:
	@echo ""
	@echo "Targets:"
	@echo "  make        -> build + run simulation"
	@echo "  make run    -> run simulation"
	@echo "  make wave   -> open GTKWave"
	@echo "  make check  -> CI waveform test"
	@echo "  make clean  -> remove build files"
	@echo ""