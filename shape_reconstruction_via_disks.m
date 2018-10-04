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

function binaryImage = shape_reconstruction_via_disks(disk_array)


X = disk_array(:,1);
Y = disk_array(:,2);
R = disk_array(:,3);


XPR = X+R; %X+R
XMR = X-R; %X-R
YPR = Y+R; %Y+R
YMR = Y-R; %Y-R

minX = min(XMR);
maxX = max(XPR);
minY = min(YMR);
maxY = max(YPR);

offset = 30;

width = floor(maxX - minX)+offset;
height = floor(maxY - minY)+offset;

binaryImage = false(width,height);

N = length(X);

[rr,cc] = meshgrid(1:height,1:width);


for c = 1 : N
    c_x = X(c)-minX + offset/2;
    c_y = Y(c)-minY + offset/2;
    r_squared = R(c)*R(c);
    
    C = (rr-c_y).^2+(cc-c_x).^2<= r_squared;
    C = logical(C);
    binaryImage = or(binaryImage,C); 
    
end

binaryImage = double(binaryImage);
end