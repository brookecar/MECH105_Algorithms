
root=0;
func=@(x) x.^3;
xl=-1;
xu=1;
maxit=200;
es=0.0001;

if ~isa(func, 'function_handle')
    error('The variable func must be a real function')
end

if func(xl)*func(xu)>=0
    error('xl and xu must satisfy the condition');
end

root=0;
ea=100;

for i=1:maxit
    old=root;
    
    root= xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    
    if sign(root)==sign(xu)
        
        xu=root;
           
    else 
        
        xl=root;
        
    end 
    
    if i>1
        ea=abs((root-old)/root)*100;
        if ea<=es
            break
        else
            if isnumeric(ea)
               break
            end
        end
    end
end

root=root;
ea=ea
fx=func(root);
iter=i;

fzero