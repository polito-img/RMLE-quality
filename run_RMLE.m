function [Q,w]=run_RMLE(vote)
     p=Solve_RMLE_optimization_problem(vote);
     Q=zeros(size(vote,1),1);

     % p is an array, make it a matrix with 5 colunms
     for i=1:length(p)/5
          w(i,:)=p( (1+5*(i-1)):(5*i))';
          Q(i)=sum(w(i,:).*(1:5));
     end
end

%%

function [p]=Solve_RMLE_optimization_problem(X)
         
   % computing  the Regularized  likelyhood function
          I=length(X(:,1));
         for i=1:I
              J(i)=sum(~isnan(X(i,:)));
         end
          
         fun=@(p) compute_regularized_likelyhood(p,X,J);  
         
         
     % setting the initial weights to the empirical fractions 
          K=1; 
          p_0=zeros(5*(I),1);
          for i=1:I
             for j=1:5
                 p_0(K)=sum(X(i,:)==j)/J(i);
                 K=K+1;
             end
          end
         
     % boundary constraints         
         lb=zeros(1,5*(I));
         ub=ones(1,5*(I));
         
     % setting the sum to 1 constraint
        Aeq=zeros(I,5*(I));
        beq=ones(I,1);
        for i=1:I
            Aeq(i,(1+5*(i-1)):(5+5*(i-1)))=[1 1 1 1 1];
        end
       

        % solving the optimization problem
        options = optimoptions('fmincon','Display','iter','Algorithm','interior-point','MaxFunctionEvaluations',1e8,'StepTolerance', 1e-4,'OptimalityTolerance',1e-6);
        d = fmincon(fun,p_0',[],[],Aeq,beq,lb,ub,[],options);
        p=d(1:5*I)';
      
end 

%%
function L=compute_regularized_likelyhood(p,X,J)
         
         % Log-likelihood component 
         L=0;
         I=length(X(:,1));
         ep=10^(-16);
         for i=1:I
             for j=1:size(X,2)
                 if ~isnan(X(i,j))
                    L=L+log( p(5*(i-1)+X(i,j))+ep); 
                 end
             end 
         end 
          
         % regularization component 
          K=1;
          f=zeros(1,5*(I));
          for i=1:(I)
             for j=1:5
                 f(K)=sum(X(i,:)==j)/J(i);
                 K=K+1;
             end
          end
         f=-log(f+ep);

         % the whole RMLE objective function
         L=-(L-(5*I/(2*mean(J)))*sum(f.*p(1:5*I)));
end 