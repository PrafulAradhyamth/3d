function [x,y,z,id,type] = extract_coordinates_from_path(path)

%this elegant way is incompatible with the older versions of matlab
% x = cellfun(@(p) p.x, path);    %the simplest way to extract coordinates from the path
% y = cellfun(@(p) p.y, path);    %if it looks complicated, you can use "for" similar to example1.m
% z = cellfun(@(p) p.z, path);

x = zeros(length(path),1);
y = x; 
z = y;
id = z;
type = id;
for i=1:length(path)
    x(i) = path{i}.x;
    y(i) = path{i}.y;
    z(i) = path{i}.z;
    id(i) = path{i}.id;
    switch path{i}.type{1}
        case 'vertex'
            type(i) = 1;
        case 'edge'
            type(i) = 2;
        case 'face'
            type(i) = 3;
        otherwise
            error('Unknown point type!')
    end
end

