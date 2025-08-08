function [all_cont,onedge,wvec,idx_first, idx_last] = segknittingmap(k,lt,all_res,ltime,TR_start,w,critical_point)

figure;
% for i = 1:length(skel) - 1
%     % Define the coordinates of points A and B on the skeleton/ reeb graph
%     x1 = skel(i, 1); y1 = skel(i, 2); z1 = skel(i, 3);
%     x2 = skel(i + 1, 1); y2 = skel(i + 1, 2); z2 = skel(i + 1, 3);
%     % Calculate the vector AB to get the angle wrt xy plane
%     % the reference plane depends on the type and orientation of the
%     % 3D object
%     AB = [x2 - x1, y2 - y1, z2 - z1];
%     % Plot the line joining points A and B
%     plot3([x1, x2], [y1, y2], [z1, z2], 'b-o', 'LineWidth', 2);
%     hold on;
% end
% view([0 -0])


hold on;
% redefining 3d points in each segment after segmenation process
for i=1:length(all_res)
    [r_ar,c_ar]=size(all_res{i, 1});
    if r_ar >= 1
        temp_all_res = all_res{i, 1}{1, 1};
        temp_all_res = temp_all_res';
        %defining the segmenation range
        segmented_defination = {1:critical_point;
            length(temp_all_res)-critical_point:length(temp_all_res);
            critical_point+1:length(temp_all_res)-critical_point};

        seg_range = segmented_defination{k, 1};
        x1 = temp_all_res(seg_range, 1); y1 = temp_all_res(seg_range, 2); z1 = temp_all_res(seg_range, 3);
        % Replace the specified range with the new vector
        new_all_res{i, 1}{1, 1}(1,1:length(x1)) = x1';
        new_all_res{i, 1}{1, 1}(2,1:length(y1)) = y1';
        new_all_res{i, 1}{1, 1}(3,1:length(z1)) = z1';
        plot3(x1,y1,z1, '*-r', 'LineWidth', 2);
    end
end
for i=1:length(all_res)
    [r_ar,c_ar]=size(all_res{i, 1});
    if r_ar == 2
        temp_all_res = all_res{i, 1}{2, 1};
        temp_all_res = temp_all_res';
        %defining the segmenation range
        segmented_defination = {1:critical_point;
            length(temp_all_res)-critical_point:length(temp_all_res);
            critical_point+1:length(temp_all_res)-critical_point};

        seg_range = segmented_defination{k, 1};
        x1 = temp_all_res(seg_range, 1); y1 = temp_all_res(seg_range, 2); z1 = temp_all_res(seg_range, 3);
        % Replace the specified range with the new vector
        new_all_res{i, 1}{2, 1}(1,1:length(x1)) = x1';
        new_all_res{i, 1}{2, 1}(2,1:length(y1)) = y1';
        new_all_res{i, 1}{2, 1}(3,1:length(z1)) = z1';
        plot3(x1,y1,z1, '*-r', 'LineWidth', 2);
    end
end

% redefining ltime in each segment after segmenation process
for i=1:length(ltime)
    [r_ar,c_ar]=size(ltime{i, 1});
    if r_ar >= 1
        temp_ltime = ltime{i, 1}{1, 1};
        %defining the segmenation range
        segmented_defination = {1:critical_point;
            length(temp_ltime)-critical_point:length(temp_ltime);
            critical_point+1:length(temp_ltime)-critical_point};

        seg_range = segmented_defination{k, 1};

        x1 = temp_ltime(seg_range, 1);
        % Replace the specified range with the new vector
        x1 = normalize_time(x1);
        new_ltime{i, 1}{1, 1} = x1;
    end
end
for i=1:length(ltime)
    [r_ar,c_ar]=size(ltime{i, 1});
    if r_ar == 2
        temp_ltime = ltime{i, 1}{2, 1};
        %defining the segmenation range
        segmented_defination = {1:critical_point;
            length(temp_ltime)-critical_point:length(temp_ltime);
            critical_point+1:length(temp_ltime)-critical_point};

        seg_range = segmented_defination{k, 1};
        x1 = temp_ltime(seg_range, 1);
        % Replace the specified range with the new vector
        x1 = normalize_time(x1);
        new_ltime{i, 1}{2, 1} = x1;
    end
end

% redefining lt in each segment after segmenation process
for i=1:length(lt)
    [r_ar,c_ar]=size(lt{i, 1});
    if r_ar >= 1
        temp_lt = lt{i, 1}{1, 1};
        %defining the segmenation range
        segmented_defination = {1:critical_point;
            length(temp_lt)-critical_point:length(temp_lt);
            critical_point+1:length(temp_lt)-critical_point};

        seg_range = segmented_defination{k, 1};
        x1 = temp_lt(seg_range, 1);
        % Replace the specified range with the new vector
        new_lt{i, 1}{1, 1} = x1;
    end
end
for i=1:length(lt)
    [r_ar,c_ar]=size(lt{i, 1});
    if r_ar == 2
        temp_lt = lt{i, 1}{2, 1};
        %defining the segmenation range
        segmented_defination = {1:critical_point;
            length(temp_lt)-critical_point:length(temp_lt);
            critical_point+1:length(temp_lt)-critical_point};

        seg_range = segmented_defination{k, 1};
        x1 = temp_lt(seg_range, 1);
        % Replace the specified range with the new vector
        new_lt{i, 1}{2, 1} = x1;
    end
end


all_idxd = reorder_wales(new_all_res,new_lt,TR_start,w);


[all_cont,onedge,wvec, all_time, all_pts] = connect_nodes4(all_idxd,new_all_res,w,new_ltime);

idx_first = sort(find(all_time<-1+1e-3));
idx_last = sort(find(all_time>1-1e-3));

end