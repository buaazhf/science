clear;
clc;
addpath('.\function');
load mnist_uint8;


train_x = single(reshape(train_x',28,28,60000,1))/255;%   60000x784  变为    28x28x60000
train_y = single(train_y);  %60000x10 
test_x = single(reshape(test_x',28,28,10000,1))/255;%   60000x784  变为    28x28x60000
test_y = single(test_y);  %60000x10 

opt.batchsize=60;
opt.startepochs=1;
opt.endepochs=20;
opt.Optimizer='Adam';
opt.alpha=0.01;%学习率参数

 %%初始化

w1=init_weights([784,50]);
w2=init_weights([50,10]);
b1=init_bias(50);
b2=init_bias(10);


cnn = {
    struct('layer', 'i') 
    struct('layer','flatten')
    struct('layer','fc','w',w1,'b',b1,'activation','Sigmod') 
    struct('layer','fc','w',w2,'b',b2,'activation','Sigmod')
    struct('layer','o','Loss','Mse')%Mse
    %struct('layer','dropout','pkeep',p)
};

cnn=CNNtrain(cnn,train_x,train_y,test_x,test_y,opt);







