trainLabel=load('trainlabel01');
testLabel=load('testlabel01');
trainLabel_double = double(trainLabel);
testLabel_double = double(testLabel);



%---------training phase---------
train4f=res3dmerging('RGB_4f', 'trainlist01')+res3dmerging('OF_4f', 'trainlist01');
train8f=res3dmerging('RGB_8f', 'trainlist01')+res3dmerging('OF_8f', 'trainlist01');
train16f=res3dmerging('RGB_16f', 'trainlist01')+res3dmerging('OF_16f', 'trainlist01');


[Wx1, Wy1, train4dca1, train8dca1] = dcaFuse(train4f', train8f', trainLabel_double);
train1 = train4dca1 + train8dca1;
[Wx2, Wy2, train4dca2, train16dca1] = dcaFuse(train4f', train16f', trainLabel_double);
train2 = train4dca2 + train16dca1;
[Wx3, Wy3, train8dca2, train16dca2] = dcaFuse(train8f', train16f', trainLabel_double);
train3 = train8dca2 + train16dca2;

train = [train1; train2; train3];
%---------testing phase---------

%RO Fusion
test4f=res3dmerging('RGB_4f', 'testlist01')+res3dmerging('OF_4f', 'testlist01');
test8f=res3dmerging('RGB_8f', 'testlist01')+res3dmerging('OF_8f', 'testlist01');
test16f=res3dmerging('RGB_16f', 'testlist01')+res3dmerging('OF_16f', 'testlist01');


%MTS Fusion
test4dca1 = Wx1 * test4f';
test8dca1 = Wy1 * test8f';
test1  = test4dca1 + test8dca1;

test4dca2 = Wx2 * test4f';
test16dca1 = Wy2 * test16f';
test2  = test4dca2 + test16dca1;

test8dca2 = Wx3 * test8f';
test16dca2 = Wy3 * test16f';
test3  = test8dca2 + test16dca2;

test = [test1; test2; test3];


% svm training
model = svmtrain(trainLabel_double, train', '-t 0');


% svm testing
[label, accuracy, predict_prob] = svmpredict(testLabel_double, test', model);

