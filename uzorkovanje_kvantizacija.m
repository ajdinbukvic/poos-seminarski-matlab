% Učitavanje originalne slike
originalnaSlika = imread('trailer.jpg');
%originalnaSlika = rgb2gray(slika);

% Prikazivanje originalne slike
figure;
subplot(2, 2, 1);
imshow(originalnaSlika);
title('Originalna slika');

% Uzorkovanje slike
faktorUzorkovanja = 2;
uzorkovanaSlika = originalnaSlika(1:faktorUzorkovanja:end, 1:faktorUzorkovanja:end, :);

% Prikazivanje uzorkovane slike
subplot(2, 2, 2);
imshow(uzorkovanaSlika);
title('Uzorkovana slika');

% Kvantizacija slike
brojNivoa = 8;
kvantizovanaSlika = imquantize(uzorkovanaSlika, linspace(0, 255, brojNivoa));

unique(kvantizovanaSlika)
kvantizovanaSlika = uint8(255 * mat2gray(kvantizovanaSlika));
unique(kvantizovanaSlika)

% Prikazivanje kvantizovane slike
subplot(2, 2, 3);
imshow(kvantizovanaSlika, []);
title('Kvantizovana slika');

% Prikazivanje histograma kvantizovane slike
subplot(2, 2, 4);
histogram(kvantizovanaSlika(:), brojNivoa);
title('Histogram kvantizovane slike');

colormap('gray');