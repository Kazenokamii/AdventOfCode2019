possibleSolution = 0;
for k = 137683:596253
    kdigits = dec2base(k,10)-'0';
    increasingRequirement = true;
    duplicatesRequirement = false;
    for j = 1:length(kdigits)-1
        if kdigits(j) > kdigits(j+1)
            increasingRequirement = false;
            break
        end
        if kdigits(j) == kdigits(j+1)
            if j == 1
                if kdigits(j) ~= kdigits(j+2)
                    duplicatesRequirement = true;
                end
            elseif j == length(kdigits)-1
                if kdigits(j-1) ~= kdigits(j)
                    duplicatesRequirement = true;
                end
            elseif kdigits(j-1) ~= kdigits(j) && kdigits(j+2) ~= kdigits(j)
                duplicatesRequirement = true;
            end
        end
    end
    if (increasingRequirement == true && duplicatesRequirement == true)
        possibleSolution = possibleSolution + 1;
    end
end
            