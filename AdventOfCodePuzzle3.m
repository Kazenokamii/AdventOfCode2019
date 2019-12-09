clear all
fid = fopen('wireOne.txt');
wireOne = textscan(fid, '%s','delimiter',',');
fclose(fid);
wireOne = wireOne{1};
fid = fopen('wireTwo.txt');
wireTwo = textscan(fid,'%s','delimiter',',');
fclose(fid);
wireTwo = wireTwo{1};
wireOneX(1) = 0;
wireOneY(1) = 0;
wireTwoX(1) = 0;
wireTwoY(1) = 0;
wireOneSum(1) = 0;
for k = 1:length(wireOne)
    coordinate = '';
    if wireOne{k}(1) == 'R'
        for j = 2:length(wireOne{k})
            coordinate = strcat(coordinate,wireOne{k}(j));
            wireOneX(k+1) = wireOneX(k) + str2num(coordinate);
            wireOneY(k+1) = wireOneY(k);
            wireOneSum(k) = str2num(coordinate);
        end
    elseif wireOne{k}(1) == 'U'
        for j = 2:length(wireOne{k})
            coordinate = strcat(coordinate,wireOne{k}(j));
            wireOneY(k+1) = wireOneY(k) + str2num(coordinate);
            wireOneX(k+1) = wireOneX(k);
            wireOneSum(k) = str2num(coordinate);
        end
    elseif wireOne{k}(1) == 'L'
        for j = 2:length(wireOne{k})
            coordinate = strcat(coordinate,wireOne{k}(j));
            wireOneX(k+1) = wireOneX(k) - str2num(coordinate);
            wireOneY(k+1) = wireOneY(k);
            wireOneSum(k) = str2num(coordinate);
        end
    elseif wireOne{k}(1) == 'D'
        for j = 2:length(wireOne{k})
            coordinate = strcat(coordinate,wireOne{k}(j));
            wireOneY(k+1) = wireOneY(k) - str2num(coordinate);
            wireOneX(k+1) = wireOneX(k);
            wireOneSum(k) = str2num(coordinate);
        end
    end
end
for k = 1:length(wireTwo)
    coordinate = '';
    if wireTwo{k}(1) == 'R'
        for j = 2:length(wireTwo{k})
            coordinate = strcat(coordinate,wireTwo{k}(j));
            wireTwoX(k+1) = wireTwoX(k) + str2num(coordinate);
            wireTwoY(k+1) = wireTwoY(k);
            wireTwoSum(k) = str2num(coordinate);
        end
    elseif wireTwo{k}(1) == 'U'
        for j = 2:length(wireTwo{k})
            coordinate = strcat(coordinate,wireTwo{k}(j));
            wireTwoY(k+1) = wireTwoY(k) + str2num(coordinate);
            wireTwoX(k+1) = wireTwoX(k);
            wireTwoSum(k) = str2num(coordinate);
        end
    elseif wireTwo{k}(1) == 'L'
        for j = 2:length(wireTwo{k})
            coordinate = strcat(coordinate,wireTwo{k}(j));
            wireTwoX(k+1) = wireTwoX(k) - str2num(coordinate);
            wireTwoY(k+1) = wireTwoY(k);
            wireTwoSum(k) = str2num(coordinate);
        end
    elseif wireTwo{k}(1) == 'D'
        for j = 2:length(wireTwo{k})
            coordinate = strcat(coordinate,wireTwo{k}(j));
            wireTwoY(k+1) = wireTwoY(k) - str2num(coordinate);
            wireTwoX(k+1) = wireTwoX(k);
            wireTwoSum(k) = str2num(coordinate);
        end
    end
end
plot(wireOneX,wireOneY);
hold on
plot(wireTwoX,wireTwoY);