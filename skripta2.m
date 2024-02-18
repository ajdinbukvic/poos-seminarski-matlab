% Uzimanje uzoraka jednostavne funkcije (simulacija slike)
originalnaSlika = @(x) sin(2*pi*x/10);  % Primjer funkcije koja simulira sliku

% Parametri uzorkovanja
frekvencijaUzorkovanja = 1;  % Frekvencija uzorkovanja

% Generisanje uzoraka
t = 0:1/frekvencijaUzorkovanja:20;  % Vremenski vektor
uzorci = originalnaSlika(t);

% Prikazivanje rezultata
figure;
plot(t, uzorci, 'o-', 'LineWidth', 2);
title('Uzorkovanje slike');
xlabel('Vrijeme');
ylabel('Amplituda');
grid on;

% Parametri kvantizacije
brojNivoa = 8;  % Broj nivoa kvantizacije

% Kvantizacija uzoraka
kvantizovaniUzorci = round((brojNivoa-1) * (uzorci - min(uzorci)) / (max(uzorci) - min(uzorci)));

% Prikazivanje rezultata
figure;
stem(t, kvantizovaniUzorci, 'LineWidth', 2);
title('Kvantizacija slike');
xlabel('Vrijeme');
ylabel('Kvantizovane vrijednosti');
grid on;

% Parametri kvantizacije
brojNivoa = 256;  % Broj nivoa kvantizacije, od 0 do 255

% Kvantizacija uzoraka
minVrijednost = min(uzorci);
maxVrijednost = max(uzorci);
kvantizovaniPiksel = round((brojNivoa - 1) * (uzorci - minVrijednost) / (maxVrijednost - minVrijednost));

% Prilagođavanje vrednosti piksela na opseg 0-255
kvantizovaniPiksel = uint8(kvantizovaniPiksel);

% Prikazivanje rezultata
figure;
subplot(2, 1, 1);
stem(uzorci, 'LineWidth', 2);
title('Originalni uzorci');

subplot(2, 1, 2);
stem(kvantizovaniPiksel, 'LineWidth', 2);
title('Kvantizovani pikseli (0-255)');