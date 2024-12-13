function [beta]=calibrate_beta(X,mu,prob_clean)
        for j=1:size(X,2)
            subj_data=X(:,j);
            id_valid_votes=~isnan(subj_data);
            bias=mu(j,:)*[1 2 3 4 5]';
            q=prob_clean*[1 2 3 4 5]';
            quality_and_bias=q+bias*ones(size(q));
            err(j)=var(X(id_valid_votes,j)-quality_and_bias(id_valid_votes));
            fun = @(b) abs(compute_logit_variance(b,mu(j,:),prob_clean,id_valid_votes)-err(j));
            lb=0; ub=100000;
            beta(j) = fmincon(fun,1,[],[],[],[],lb,ub);
        end
end 


function teo_Var=compute_logit_variance(b,mu,prob_clean,id_valid_votes)
         Prob_logit=zeros(length(prob_clean(:,1)),5);
         U = prob_clean+((ones(length(prob_clean(:,1)),1)*mu));
         for j=1:length(prob_clean(:,1))
             Prob_logit(j,:)=exp(b*U(j,:))/sum(exp(b(1 )*U(j,:)));
         end 
         teo_Vars=([1 4 9 16 25]*(Prob_logit(id_valid_votes,:))'-([1 2 3 4 5]*(Prob_logit(id_valid_votes,:))').^2)';
         teo_Var=mean(teo_Vars);
end