% Copyright Morteza Rezanejad & Gabriel Downs
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



% Top level function for computing AOF Skeletons of 2D Binary Images
function generate_skeletons(img_path, varargin)
  % initiate inputParser to handle optional arguments
  p = inputParser;
  
  % optional `negate` boolean argument, determines whether img color is inverted
  % default is False, verifies value is type `logical` 
  p.addParameter('invert', false, @islogical);

  % optional path to save skeleton
  p.addParameter('skeleton_path', '', @(x) true);
  
  % parse optional args
  p.parse(varargin{:});
  args = p.Results

  % determine if img_path is existing single image file
  if exist(img_path, 'file') == 2
    % read image file as binary matrix 
    I = imread(img_path);
    % use single channel only (input images should be grayscale)
    I = I(:,:,1);
    % convert to binary matrix of type double (white=1,black=0)
    I = double(logical(I));

    % flip black/white if `invert` arg is set to true
    if args.invert
      I = double(~I);
    end

    % compute sekelton
    skeleton = extract2DSkeletonFromBinaryImage(I);

    % write to output file (if specified)
    if ~strcmp(args.skeleton_path, '')
      imwrite(skeleton, args.skeleton_path);
    end 

    % display skeleton
    figure
    imagesc(skeleton);
    colormap('gray');

  % TODO: directories
  else
    error('img_path must point to an existing file')
  end
end
