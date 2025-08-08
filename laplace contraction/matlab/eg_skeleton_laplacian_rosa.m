% function [] = eg_point_cloud_curve_skeleton(filename)
% extract curve skeleton from a point cloud or triangular mesh


%% setting
clear;clc;close all;
path('toolbox',path);
options.USING_POINT_RING = GS.USING_POINT_RING;
extension='.off';


%% Step 0: read file (point cloud & local feature size if possible), and
% normalize the modle.
% filename = '../data/9HandleTorus';% which file we should run on
filename = 'bent_cylinder'
tic
P.filename = [filename extension];% point set
[P.pts,P.faces] = read_mesh(P.filename);
P.npts = size(P.pts,1);
if exist([filename '_fe.txt'],'file') % result of Tamal K Dey's NormFet
    P.radis = load([filename '_fe.txt']);
else
    P.radis = ones(P.npts,1);
end

P.pts = GS.normalize(P.pts);
[P.bbox, P.diameter] = GS.compute_bbox(P.pts);
disp(sprintf('read point set:'));
toc

%% Step 1: build local 1-ring
% build neighborhood, knn?
tic
P.k_knn = GS.compute_k_knn(P.npts);
if options.USING_POINT_RING
    P.rings = compute_point_point_ring(P.pts, P.k_knn, []);
else    
    P.frings = compute_vertex_face_ring(P.faces);
    P.rings = compute_vertex_ring(P.faces);
end
disp(sprintf('compute local 1-ring:'));
toc

%% Step 1: Contract point cloud by Laplacian
tic
[P.cpts, t, initWL, WC, sl] = contraction_by_mesh_laplacian(P, options);
disp(sprintf('Contraction:'));
toc
figure
scatter3(P.pts(:,1),P.pts(:,2), P.pts(:,3),'filled','MarkerEdgeColor','k');
title(['iterate ','1',' time(s)']);
view(-3,10)
figure
scatter3(P.cpts(:,1),P.cpts(:,2), P.cpts(:,3),'filled','MarkerEdgeColor','k');
view(-3,10)
