startup_files := out/startup_cura.gcode out/startup_prusa.gcode

out/startup_cura.gcode: startup_template.gcode
	@[ -d out ] || mkdir out
	@cp $< $@
	sed -i 's/BED_TEMP/material_bed_temperature_layer_0/' $@
	sed -i 's/MATERIAL_TEMP/material_print_temperature_layer_0/' $@

out/startup_prusa.gcode: startup_template.gcode
	@[ -d out ] || mkdir out
	@cp $< $@
	sed -i 's/BED_TEMP/first_layer_bed_temperature[0]/' $@
	sed -i 's/MATERIAL_TEMP/first_layer_temperature[0]/' $@
	sed -i '/M82/d' $@

all: $(startup_files)
cura: out/startup_cura.gcode
prusa: out/startup_prusa.gcode
clean:
	@rm -r out

.PHONY: cura prusa clean all
