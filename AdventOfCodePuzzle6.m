clear all
fid = fopen('Puzzle6Orbits.txt');
orbits = textscan(fid, '%s');
fclose(fid);
orbits = orbits{1};
keepingOrbits = orbits;
count = 0;
x = length(orbits);
k = 1;
while k < x
    if orbits{k}(1:3) == 'COM'
        count = count + 1;
        orbitsCount(1).name = 'COM';
        orbitsCount(2).name = orbits{k}(5:7);
        orbitsCount(2).distance = 1;
        orbits(k) = [];
        x = length(orbits);
    end
    k = k+1;
end
for k = 1:length(orbitsCount)
    orbitMembers{k} = orbitsCount(k).name;
end
while length(orbits) > 1
    while k < x
        if ismember(orbits{k}(1:3),orbitMembers)
            index = find(strcmp({orbitsCount.name}, orbits{k}(1:3)));
            orbitsCount(end+1).name = orbits{k}(5:7);
            orbitsCount(end).distance = orbitsCount(index).distance+1;
            orbitMembers{end+1} = orbits{k}(5:7);
            orbits(k) = [];
            x = length(orbits);
        end
        k = k+1;
    end
    k = 1;
end
index = find(strcmp({orbitsCount.name}, orbits{1}(1:3)));
orbitsCount(end+1).name = orbits{1}(5:7);
orbitsCount(end).distance = orbitsCount(index).distance+1;
orbitMembers{end+1} = orbits{1}(5:7);
orbits(1) = [];
totalOrbits = 0;
for k = 2:length(orbitsCount)
    totalOrbits = totalOrbits + orbitsCount(k).distance;
end
distance = 350;
youPath{1} = 'YOU';
youPathFind = 'YOU';
santaPath{1} = 'SAN';
santaPathFind = 'SAN';
while distance > 0
    for k = 1:length(keepingOrbits)
        if strcmp(youPathFind,keepingOrbits{k}(5:7))
            youPathFind = keepingOrbits{k}(1:3);
            youPath{end+1} = youPathFind;
        end
        if strcmp(santaPathFind,keepingOrbits{k}(5:7))
            santaPathFind = keepingOrbits{k}(1:3);
            santaPath{end+1} = santaPathFind;
        end
    end
    distance = distance - 1;
end
count = 0;
meetingYou = inf;
for k = length(youPath):-1:1
    for j = length(santaPath):-1:1
        if strcmp(youPath{k},santaPath{j})
            if k<meetingYou
                meetingYou = k;
            end
            meetingSanta = j;
            count = count + 1;
        end
    end
end