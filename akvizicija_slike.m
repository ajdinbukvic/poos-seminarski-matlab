% Prikazivanje dostupnih uređaja
disp(imaqhwinfo);
disp(imaqhwinfo('winvideo'));

% Adaptersko ime i format prema informacijama dobijenim iz prethodnog koraka
adaptorName = 'winvideo';
videoFormat = 'YUY2_640x480'; 

% Kreiranje video objekta
vid = videoinput(adaptorName, 1, videoFormat);
vid.ReturnedColorspace = "rgb";

% Prikazivanje uživo
preview(vid);

% Akvizicija slike
img = getsnapshot(vid);

% Primjer: Prikazivanje originalne i obrađene slike
figure;
subplot(1, 2, 1);
imshow(img);
title('Originalna slika');

% Primjer obrade slike
grayImg = rgb2gray(img);
subplot(1, 2, 2);
imshow(grayImg);
title('Obradjena slika');

% Zaustavljanje prikazivanja uživo
stoppreview(vid);

% Oslobađanje resursa
delete(vid);
clear vid;