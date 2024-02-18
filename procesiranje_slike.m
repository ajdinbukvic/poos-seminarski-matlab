img = imread('coloredChips.png');
grayImg = rgb2gray(img);

edgeImg = edge(grayImg, 'Sobel');

% Prikazivanje originalne slike i rezultata detekcije ivica
figure;
subplot(1, 2, 1);
imshow(grayImg);
title('Originalna slika');

subplot(1, 2, 2);
imshow(edgeImg);
title('Detekcija ivica');

threshold = graythresh(grayImg);
binaryImg = imbinarize(grayImg, threshold);
figure;
imshow(binaryImg);
title('Segmentacija slike');

% Gausov filter
gaussianImg = imgaussfilt(grayImg, 2);
figure;
subplot(1, 2, 1);
imshow(grayImg);
title('Originalna slika');

subplot(1, 2, 2);
imshow(gaussianImg);
title('Gausov filter');

hsvImg = rgb2hsv(img);
figure;
subplot(1, 2, 1);
imshow(img);
title('Originalna slika');

subplot(1, 2, 2);
imshow(hsvImg);
title('HSV prostor boja');

% Primjer analize oblika na binarnoj slici
stats = regionprops(binaryImg, 'Area', 'Centroid', 'BoundingBox');
figure;
imshow(binaryImg);
hold on;
for i = 1:numel(stats)
    rectangle('Position', stats(i).BoundingBox, 'EdgeColor', 'r', 'LineWidth', 2);
    plot(stats(i).Centroid(1), stats(i).Centroid(2), 'r*');
end
hold off;
title('Analiza oblika objekata');

% Prikazivanje histograma
imhist(grayImg);
title('Histogram slike');

% Prikazivanje broja objekata
numObjects = numel(stats);
bar(1:numObjects, [stats.Area]);
title('Broj objekata po površini');
xlabel('Objekat');
ylabel('Površina');

% Prikazivanje analize boja u HSV prostoru
hueValues = hsvImg(:,:,1);
histogram(hueValues, 'BinEdges', linspace(0, 1, 20), 'Normalization', 'probability');
title('Raspodela nijansi boja (Hue)');
xlabel('Nijansa (Hue)');
ylabel('Vjerovatnoća');