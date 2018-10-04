% Copyright Morteza Rezanejad
% McGill University, Montreal, QC 2018
%
% Contact: morteza [at] cim [dot] mcgill [dot] ca 
% -------------------------------------------------------------------------
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <https://www.gnu.org/licenses/>.
% -------------------------------------------------------------------------

% Auto-Generate C code from .m files and compile to MEX binaries

% compile compute_aof.m
v1 = coder.newtype('single', [Inf Inf]);
v2 = coder.newtype('uint32', [Inf Inf]);
v3 = coder.newtype('double', [Inf Inf]);
v4 = coder.newtype('double', [1 1]);
codegen compute_aof -args {v1, v2, v3, v4} -o compute_aof

% compile compute_gradient_vector_field.m
v = coder.newtype('double', [Inf Inf]);
codegen compute_gradient_vector_field -args v -o compute_gradient_vector_field
