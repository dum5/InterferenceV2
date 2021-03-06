function         [avg_vect, se_vect ] = average_ca(ca_to_avg)

nc = length(ca_to_avg);
min_len = min(cellfun(@length,ca_to_avg)); %Number of subjects in each group
cut_curves = zeros(nc, min_len); 

for i=1:nc
   cut_curves(i,:) = ca_to_avg{i}(1:min_len); 
end
notNan = length(~isnan(cut_curves));
avg_vect = nanmean(cut_curves,1);
se_vect = nanstd(cut_curves,0,1)/sqrt(notNan);


end