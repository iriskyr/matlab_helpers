close all
clear all
clc

format long

%feats = load('/home/iriditsa/catkin_ws/robolimb/Data/features.txt');
labels = load('/home/iriditsa/catkin_ws/robolimb/Data/labels.txt');
emg = load('/home/iriditsa/catkin_ws/robolimb/Data/emgdata.txt');
imu = load('/home/iriditsa/catkin_ws/robolimb/Data/imdata.txt');
keys = load('/home/iriditsa/catkin_ws/robolimb/Data/keyInfo.txt');



for i = 100:size(labels,1)
  if labels(i) == 4
    break;
  end
  lab(i) = labels(i);
end

obj1 = find(keys == 49);
obj2 = find(keys == 50);
obj3 = find(keys == 51);


time_start = keys(obj1(1), 2);
time_end = keys(obj1(2), 2);



emg_ind = find(emg(:,1) > time_start & emg(:,1) < time_end);
imu_ind = find(imu(:,1) > time_start & imu(:,1) < time_end);

figure(1)

subaxis(4,1,1, 'Spacing', 0.03, 'Padding', 0, 'Margin', 0);
plot(emg(emg_ind, 2));

C = {[141, 211, 199]/255;[ 255, 237, 111]/255;[ 190, 186, 218]/255;[ 251, 128, 114]/255;[ 128, 177, 211]/255;[ 253, 180, 98]/255;[ 179, 222, 105]/255;[ 188, 128, 189]/255;[ 217, 217, 217]/255;[ 204, 235, 197]/255;[ 252, 205, 229]/255;[ 255, 255, 179]/255};

for im = 0:2
  subaxis(4,1,im+2, 'Spacing', 0.03, 'Padding', 0, 'Margin', 0);
  hold on
  for i=1:3
    plot(imu(imu_ind, (im*3)+i+1), 'color', C{(im*3)+i}, 'LineWidth', 2)
  end
  
  hold off

  
end



