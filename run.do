vlog top.sv 
vsim -novopt -suppress 12110 top
add wave 
# do wave.do
run -all

#-position insertpoint sim:/top/pinf/*