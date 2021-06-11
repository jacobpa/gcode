; Script to generate UBL mesh
M140 S60    ; Warm bed to about print temp
M104 S150   ; Warm nozzle to point where nothing extrudes
G28         ; Home all axes
M190 S60    ; Wait for bed temp. to stabilize
M109 S150   ; Wait for nozzle temp. to stabilize
G29 A       ; Activate UBL
G29 P1      ; Create UBL Mesh
G29 P3      ; Figure out parts it can't reach
G29 S0      ; Save to slot 0
G29 F 10.0  ; Set fade height to 10 mm
M500        ; Save settings
