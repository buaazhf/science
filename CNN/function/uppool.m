function  output=uppool(input,mode,ksize,strides,padding,p,al)

%inputΪ��l+1��ľ����ݶȣ�outputΪ��l������ݶ�
%alΪ��l������ֵ
%pΪl+1�㼴�²�����Ϊmaxpoolʱ���Ԫ��λ�ñ�Ǿ���,ΪmeanpoolʱֵΪNAN

a=strides(1);b=strides(2);
c=ksize(1);d=ksize(2);
AA=expand(input,[c d 1 1]);
BB=zeros(size(al));

if  strcmp(padding, 'VALID')
             BB(1:size(AA,1),1:size(AA,2),:,:)=AA;
elseif  strcmp(padding, 'SAME')
             pad_needed_height=(ceil(size(al,1)/a)-1)*a+c-size(al,1);
             pad_needed_width=(ceil(size(al,2)/b)-1)*b+d-size(al,2);
             BB=AA(floor(pad_needed_height/2)+1:floor(pad_needed_height/2)+size(BB,1),floor(pad_needed_width/2)+1:floor(pad_needed_width/2)+size(BB,2),:,:);
end

if  strcmp(mode, 'mean')
             output=BB/(c*d);
elseif strcmp(mode, 'max')
             output=p.*BB;
end


end
