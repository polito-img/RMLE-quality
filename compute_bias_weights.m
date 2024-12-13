
function [bias_weights]=compute_bias_weights(X,W)
    M=size(X,1);
    N=size(X,2);
    bias_weights=zeros(N,5);
    for j=1:N 
        positional_bias_el=[];
        for i=1:M 
            if ~isnan(X(i,j)) 
                positional_bias_el=[positional_bias_el;to_vett(X(i,j))-W(i,:) ];
            end
        end
        bias_weights(j,:)=mean(positional_bias_el,1);
    end
end


%%
function v=to_vett(r)
        v=zeros(1,5);
        v(r)=1;
end