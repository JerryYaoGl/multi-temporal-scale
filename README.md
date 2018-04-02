# multi-temporal-scale


learning multi-temporal-scale deep information for action recognition</br>
Guangle Yao, Tao Lei, Jiandan Zhong, Ping Jiang</br>
</br>
</br>
</br>
Usage Guide</br>
</br>
1. Prerequisites</br>
Download and Install 'Res3D'</br>
Download and Install 'LibSVM'</br>
Matlab->SetPath->AddWithSubfolders: add LibSVM/matlab</br>
Prepare UCF101 RGB image and 3-channel optical flow</br>
Update *.lst,   *list   *prefix in OF_xf and RGB_xf (There will be some minor differences due to different codec)</br>
cp -rf Res3d-multi-temporal-scale Res3DPATH/examples/</br>
cd Res3DPATH/examples/Res3d-multi-temporal-scale</br>
wget https://www.dropbox.com/s/qqfrg6h44d4jb46/c3d_resnet18_sports1m_r2_iter_2800000.caffemodel</br>
</br>
2. finetuning</br>
./MTS_finetuning.sh</br>
</br>
3. feature extraction</br>
./MTS_feature_extraction.sh</br>
</br>
4. action recognition (in matlab)</br>
MTS_action_recognition</br>
</br>

This code is for UCF101 split01
