; Ender 3 V2 Custom Start G-code - UBL Mesh Tilt
M83 										; Extruder relative mode, only for startup
M140 S{material_bed_temperature_layer_0} 	; Set Bed temp for layer 0
M104 S150 									; Heat extruder, not so much that anything melts
M190 S{material_bed_temperature_layer_0} 	; Wait for bed temp
M109 S150 									; Wait for extruder Temp
G28 										; Home all axes
G29 L0 										; Load UBL Mesh 0
G29 J3										; 3x3 Grid to tilt UBL mesh
G29 A 										; Activate UBL mesh
G1 Z25 F300 								; Move up before preheat to print temp
G1 X0.1 Y20 F5000 							; Move to start position, not down yet

M109 S{material_print_temperature_layer_0}  ; Warm extruder to starting print temp

G1 Z0.3 F300.0 								; Move down to start position
G92 E0 										; Reset Extruder
G1 Y200.0 E10 F1500.0  						; Draw the first line
G1 X0.4 F5000.0 							; Move to side a little
G92 E0 										; Reset Extruder
G1 Y20 E10 F1500.0  						; Draw the second line
G92 E0 										; Reset Extruder
G1 Z2.0 F3000 								; Move Z Axis up little to prevent scratching of Heat Bed
G1 X5 Z0.3 F5000.0 							; Move down and over to prevent blob squish
M82 										; Extruder absolute mode, Cura by default generates GCode in absolute
