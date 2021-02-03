% Adam Gauthier ELEC4700 PA4
% Laplace Eq by iteration
close all; clear all;
nx = 50; % x size
ny = 50; % y size
V = zeros(nx,ny); % create voltage matrix

%initialize V
V(:,1) = -10; %left side = 1
V(:,nx) = 10; %right side = 1
V(1,:) = 0; %bottom = 0
V(ny,:) = 0; % top = 0

maxIt = 200; % max iterations
it = 0;

%Loop and update cells not on boudaries
%Use difference eq.
subplot(4,1,1);hold on;
title('Surf of V');surf(V);view(3);hold off;
subplot(4,1,2);hold on;
[Ex,Ey]=gradient(V);
title('Surf of E');surf(Ex,Ey);view(3);hold off;
subplot(4,1,3);hold on;
title('Quiver of E');quiver(Ex,Ey);view(2);hold off;
subplot(4,1,4);hold on;
i = imboxfilt(V,3);
title('imboxfilt(V,3)');surf(i);view(3);hold off;


while it<=maxIt
    for x = 2:nx-1
        for y = 2:ny-1
            V(x,y) = (V(x+1,y)+V(x-1,y)+V(x,y+1)+V(x,y-1))/4;
        end
    end
    subplot(4,1,1);hold on;
    surf(V);
    hold off;
    [Ex,Ey]=gradient(V);
    subplot(4,1,2);hold on;
    surf(Ex,Ey);
    hold off;
    subplot(4,1,3);hold on;
    quiver(Ex,Ey);
    hold off;
    subplot(4,1,4);hold on;
    i = imboxfilt(V,3);
    surf(i)
    hold off;
    
    pause(0.01);
    it=it+1;
end



