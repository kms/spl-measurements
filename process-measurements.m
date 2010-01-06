% spl-measurements
% Octave (MATLAB) code for processing the measurements
%
% (c) Karl-Martin Skontorp <kms@skontorp.net> ~ http://picofarad.org/
% Licensed under the GNU GPL 2.0 or later.

% Converting a C-weighted measurement into dB SPL
% Sourced from http://commons.wikimedia.org/wiki/File:Weighting_curves.png
function retval = GC(s)
  kC = 5.917976426561615E+9;
  retval = kC.*s.^2 ./ ((s+129.4).^2 .* (s+76655).^2);
endfunction

function retval = dBC(f)
  retval = 20 .* log10(abs(GC(2 .* (0.0 + 1.0i) .* pi .* f)));
endfunction


[freq, db] = textread("SPL-Homeoffice-2010-01-06.csv", "%f %* %f");

% Remove C-weighting
db -= dBC(freq);
% Normalize so that 0dB equals maximum
db -= max(db);

dlmwrite("gnuplot.g", [freq, db], ", ");
