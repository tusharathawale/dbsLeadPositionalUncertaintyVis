% Draw a low-resolution Monte Carlo sample from a filtered high-resolution image
% for a given offset and voxelSpacing

% filteredV: A high-resolution filtered volume
% dwnRate: downsampling rate/inter-slice distance for a low-resolution
% sample in mm along X-Y-Z
% offset: starting offset along X-Y-Z in mm (1x3 array) for downsampling
% process
% voxelSpacing: inter-voxel distance for high-resolution filtered volume

function dwnV = pickPlanesInFilteredImage(filteredV, dwnRate, offset, voxelSpacing)

[a, b, c] = size(filteredV);

offset = [round(offset(1)/voxelSpacing(1,1)), round(offset(2)/voxelSpacing(1,2)), round(offset(3)/voxelSpacing(1,3))];
smpRate = [round(dwnRate(1)/voxelSpacing(1,1)), round(dwnRate(2)/voxelSpacing(1,2)), round(dwnRate(3)/voxelSpacing(1,3))];

xArr = 1+offset(1):smpRate(1):a;
yArr = 1+offset(2):smpRate(2):b;
zArr = 1+offset(3):smpRate(3):c;

dwnV = filteredV(xArr, yArr, zArr);

%  startX = startPlaneId(1)*smpRate(1);
%  startY = startPlaneId(2)*smpRate(2);
%  startZ = startPlaneId(3)*smpRate(3);
% 
% % Downsample (pick planes at specific offset)
% if(signArray(1) > 0 && signArray(2) > 0)	
% 	dwnV = filteredV(startX+offset(1):smpRate(1):a - startX, startY+offset(2):smpRate(2):b - startY,startZ+offset(3):smpRate(3): c-startZ);
% elseif(signArray(1) > 0 && signArray(2) < 0)	
% 	dwnV = filteredV(startX+offset(1):smpRate(1):a - startX, b-startY-offset(2):-smpRate(2):startY, startZ+offset(3):smpRate(3): c-startZ);
% elseif(signArray(1) < 0 && signArray(2) > 0)
% 	dwnV = filteredV(a - startX - offset(1):-smpRate(1): startX, startY+offset(2):smpRate(2):b - startY, startZ+offset(3):smpRate(3): c-startZ);
% elseif(signArray(1) < 0 && signArray(2) < 0)
% 	dwnV = filteredV(a - startX - offset(1):-smpRate(1): startX, b-startY-offset(2):-smpRate(2):startY, startZ+offset(3):smpRate(3): c-startZ);
% end
