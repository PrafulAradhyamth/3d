function level_total = form_total_levels(contours_total)
level_total = cell(length(contours_total),1);
tol = 1e-4;
for i=1:length(contours_total)
    l = [];
    for j=1:size(contours_total{i},2)
        if norm(contours_total{i}{j}(:,1)-contours_total{i}{j}(:,end))<tol
            l = cat(2,l,contours_total{i}{j}(:,1:end-1));
        else
            l = cat(2,l,contours_total{i}{j});
        end
    end
    level_total{i} = l;
end
