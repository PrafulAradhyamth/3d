function [jac_flat] = jac_maker(all_cont,onedge,wvec,idx_first, idx_last)
global geodesic_library;
geodesic_library = 'geodesic_release';
set_interpreter_paths

%%
% create the initial 2D structure
jac = create_initial_jac(all_cont,onedge,wvec,idx_first, idx_last);

% correct the initial jacquard, partly repeated in postprocess2D
jac = stitch_placement(jac);

[jac2,gleft,gright] = postprocess2D(jac,wvec);

jac_patch2 = cell(length(jac2),1);

for k=1:length(jac2)
    jaccolors = ones(length(jac2{k}),1);
     jac_patch2{k} = jaccolors;
     %scatter(jac2{k},k*ones(length(jac2{k}),1),5,jaccolors,'o','filled')
     %hold on; grid on
     %drawnow
end

%% generate ascii and a bitmap
[rgbs,trueops,ops] = importCAjson('ISPO2019_Farbpalette.scpx','knit_encoding_s2k.json');
jac_str = generate_ascii_json(jac2,gleft,gright,[],[],[],[],jac_patch2);
jac_flat = cell(length(jac_str),1);
for i=1:length(jac_str)
    jac_flat{i} = strcat(jac_str{i,:}); 
end

end