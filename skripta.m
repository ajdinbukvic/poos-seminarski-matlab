% Prijmer image sensing
originalnaSlika = imread('sherlock.jpg');
imshow(originalnaSlika);

% Dodavanje šuma
slikaSaSumom = imnoise(originalnaSlika, 'gaussian');
figure;
imshow(slikaSaSumom);

% Prijmer procesa image acquisition
% Prilagođavanje kontrasta
prilagodjenaSlika = imadjust(slikaSaSumom, [0.2 0.8], []);
figure;
imshow(prilagodjenaSlika);

% Filtriranje slike
filter = fspecial('gaussian', [5 5], 2);
filtriranaSlika = imfilter(prilagodjenaSlika, filter);
figure;
imshow(filtriranaSlika);

