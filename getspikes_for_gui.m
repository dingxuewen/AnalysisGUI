function sp=getspikes_for_gui(x,thresh,minISI)
x=x/max(x);
dx=diff(x);

if max(dx)>thresh
    
    sp=find(x>thresh);
    
    if ~isempty(sp)
        if size(sp,1) < size(sp,2),sp=sp';end
        dsp=[1000000;diff(sp)];
        indices=find(dsp>minISI);
        
        indices
        numel(sp)
        sp=sp(indices);
        starts=sp;ends=sp+5;
        
        ends(find(ends>numel(x)))=numel(x);
        nsp=[];
        for i=1:numel(sp)
            v=x(starts(i):ends(i));
            m=find(v==max(v));m=m(1);
            nsp(i)=starts(i)+m-1;
        end
        sp=nsp;
    end
else
    sp=[];
end


