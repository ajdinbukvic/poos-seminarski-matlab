width = 1024;
height = 1024;
grayLevels = 256;
bitDepth = log2(grayLevels);
headerSize = 32;

fileSize = width * height * (bitDepth / 8) + headerSize;
fprintf("a) Velicina u bajtima: %d\n", fileSize)

newWidth = width / 2;
newHeight = height / 2;

newFileSize = newWidth * newHeight * (bitDepth / 8) + headerSize;
fprintf("b) Nova velicina u bajtima nakon uzorkovanja: %d\n", newFileSize)

pixelsPerByte = 2;

newBitDepth = log2(pixelsPerByte);
newFileSizeRequantized = width * height * (newBitDepth / 8) + headerSize;
fprintf("c) Nova velicina u bajtima nakon kvantizacije: %d\n", newFileSizeRequantized)

newGrayLevels = 2^newBitDepth;
fprintf("d) Broj nivoa sive prethodne slike: %d\n", newGrayLevels)
