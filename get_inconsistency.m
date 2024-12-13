function [avg_inc, prob_logit, beta]=get_inconsistency (vote,nu,prob_clean)

  
  beta=calibrate_beta(vote,nu,prob_clean);

  attractiveness_subj=[];

  for i=1:size(vote,2)

      subj_data=vote(:,i);
      id_valid_votes=~isnan(subj_data);

      prob_subj_logit=zeros(size(vote,1),5);
      attractiveness_subj= prob_clean+((ones(length(vote(:,1)),1)*nu(i,:)));

      for j=1:length(vote(:,1))
          prob_subj_logit(j,:)=(exp(beta(i)*attractiveness_subj(j,:))/sum(exp(beta(i)*attractiveness_subj(j,:))));
      end

      inconsistencies_of_i=([1 4 9 16 25]*(prob_subj_logit)'-([1 2 3 4 5]*(prob_subj_logit)').^2)';
      avg_inc(i)= sqrt(mean(inconsistencies_of_i(id_valid_votes)));
  end

end