clear all
fid = fopen('asteroidPoints.txt');
asteroids = textscan(fid, '%s');
fclose(fid);
asteroids = asteroids{1};
rows = length(asteroids);
columns = length(asteroids{1});
for row = 1:rows
    for column = 1:columns
        asteroidGrid(row,column) = asteroids{row}(column);
    end
end
count = 1;
for row = 1:rows
    for column = 1:columns
        if strcmp(asteroidGrid(row,column),'#')
            asteroidPoints(count) = {[column-1,row-1]};
            count = count+1;
        end
    end
end
bestNumberAsteroids = 0;
bestAsteroidPositions{1} = '';
for asteroid = 1:length(asteroidPoints)
    asteroidEquations{1} = 'inf,self,pos';
    asteroidPositions{1} = '';
    asteroidsSeen = 0;
    currentAsteroid = asteroidPoints(asteroid);
    indexModifier = 0;
    for asteroidLine = 1:length(asteroidPoints)
        y1 = currentAsteroid{1}(1);
        y2 = asteroidPoints{asteroidLine}(1);
        x1 = currentAsteroid{1}(2);
        x2 = asteroidPoints{asteroidLine}(2);
        if x1 == x2
            m = 'inf';
            if y1 > y2
                b = '-1';
            elseif y1 < y2
                b = '1';
            else
                b = 'self';
            end
            ident = 'pos';
        else
            m = (y2-y1)/(x2-x1);
            if x1>x2
                ident = 'neg';
            else
                ident = 'pos';
            end
            b = -(y2-y1)/(x2-x1)*x1+y1;
            m = num2str(m);
            b = num2str(b);
        end
        asteroidEquation = {strcat(m,',',b,',',ident)};
        if ~ismember(asteroidEquation,asteroidEquations)
            asteroidEquations(end+1) = asteroidEquation;
            asteroidsSeen = asteroidsSeen + 1;
            asteroidPositions(asteroidsSeen) = {[y2,x2]};
        else
            index = find(strcmp(asteroidEquation,asteroidEquations));
            if index ~= 1
                y3 = asteroidPositions{index-1}(1);
                x3 = asteroidPositions{index-1}(2);
                if abs(abs(y1-y2)+abs(x1-x2)) < abs(abs(y1-y3)+abs(x1-x3))
                    asteroidPositions(index-1) = {[y2,x2]};
                end
            end
        end
    end
    if asteroidsSeen > bestNumberAsteroids
        bestNumberAsteroids = asteroidsSeen;
        bestPoint = currentAsteroid;
        bestAsteroidEquations = asteroidEquations;
        bestAsteroidPositions = asteroidPositions;
    end
    asteroidEquations = '';
end
bestAsteroidEquations(1:end-1) = bestAsteroidEquations(2:end);
bestAsteroidEquations(end) = '';
asteroidsShot = 0;
for negs = 1:length(bestAsteroidPositions)
    bestAsteroidPositions{negs}(2) = -(bestAsteroidPositions{negs}(2));
end
for angle = 1:length(bestAsteroidPositions)
    v1 = [bestPoint{1}(1),-bestPoint{1}(2)]-[22,-21];
    v2 = [bestPoint{1}(1),-bestPoint{1}(2)]-[bestAsteroidPositions{angle}(1),bestAsteroidPositions{angle}(2)];
    a = atan2d(v1(1)*v2(2)-v1(2)*v2(2),v1(2)*v2(1)+v1(2)*v2(2));
    if a < -45
        a = a + 405;
    else
        a = a + 45;
    end
    angles(angle) = a+45;
end
sortedAngles = sort(angles);