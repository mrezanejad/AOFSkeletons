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

function [skeletonImage,fluxImage,distImage]=extract2DSkeletonFromBinaryImage(binaryImage)


% init parameters
number_of_samples = 60;
epsilon = 1 ;
flux_threshold = 18;

% Computing Gradient Vector Field
[distImage,IDX] = compute_gradient_vector_field(binaryImage);


% Consider a sphere with radius 1 with some sample points on that
sphere_points = sample_sphere_2D(number_of_samples);

% Computing Average outward flux
fluxImage = compute_aof(distImage,IDX,sphere_points,epsilon);



% computing skeletonImage based on flux
skeletonImage = fluxImage;
skeletonImage(fluxImage < flux_threshold) = 0;
skeletonImage(fluxImage > flux_threshold) = 1;



end