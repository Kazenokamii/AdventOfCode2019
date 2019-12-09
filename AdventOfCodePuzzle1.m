clear all
fid = fopen('PuzzleInput.txt');
Stars = textscan(fid, '%s');
fclose(fid);
Stars = Stars{1};
totalFuelRequirement = 0;
for k = 1:length(Stars)
    fuelRequired = floor(str2num(Stars{k})/3)-2;
    additionalFuelRequired = floor(fuelRequired/3)-2;
    while additionalFuelRequired > 0
        fuelRequired = fuelRequired + additionalFuelRequired;
        additionalFuelRequired = floor(additionalFuelRequired/3) - 2;
    end
    totalFuelRequirement = totalFuelRequirement + fuelRequired;
end