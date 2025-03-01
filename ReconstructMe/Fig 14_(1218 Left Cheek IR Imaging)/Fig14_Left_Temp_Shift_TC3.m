clear all;close all;
% compare the temperature reading from IR image with the reading of thermal
% couple, and apply the shift to IR image to match the temperature
% measurmed by thermal couple (using the thermal couple tip location) based
% on TC3
stampTC='TC3';
[ImR_TC]= Read_IR_raw_data_NEW(stampTC,0);
[ImT_TC]= TempConvert_NEW_Vig_Correct(ImR_TC);

Shift=13.5;

ImT_TC_SHIFT=ImT_TC-Shift;

Temp_limit=[28.3 33.8];
%% show the shiftting effect when the thermal couple location is imaged
figure(1);
imagesc(ImT_TC_SHIFT)
caxis(Temp_limit);


%% applying the shifting to IR image wihout thermal couple included

stamp='Left3';
[ImR_Test]= Read_IR_raw_data_NEW(stamp,0);
[ImT_Test]= TempConvert_NEW_Vig_Correct(ImR_Test);

ImT_Test_SHIFT=ImT_Test-Shift;
figure(2);
imagesc(ImT_Test_SHIFT)
caxis(Temp_limit);

% Color code to be compared with Figure12
figure(3);
imagesc(ImT_Test_SHIFT)
caxis([31 33.8]); 
axis off;