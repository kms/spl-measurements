# spl-measurements
# gnuplot code for plotting the measurements.
#
# (c) Karl-Martin Skontorp <kms@skontorp.net> ~ http://22pf.org/
# Licensed under the GNU GPL 2.0 or later.

reset

set output 'SPL-Homeoffice-2010-01-06.ps'
set terminal postscript color
set termoption enhanced

set size 0.95, 0.85

set label 1 "SPL measurements for the home office"
set label 1 at screen 0.5,1.0 center offset character 0,-1
set label 2 "\
TES 1350, HP 3325A, Logitech Z-2300, volume knob at 25%, \
bass at middle setting, 2.5V_{p-p}, 1m distance to speakers\n\
0dB = 99.9dB_{SPL} = 99.5dBA (\\@85Hz)\n\
2010-01-06 \\~ kms\\@skontorp.net \\~ http://22pf.org/" 
set label 2 at screen 0.5,1.0 center offset 0, -2
set label 2 font "Normal,6"

set xlabel "Hz"
set ylabel "dB"
set logscale x
set yrange[:0]
set ytics 6
set samples 1000

plot "gnuplot.g" notitle smooth csplines
