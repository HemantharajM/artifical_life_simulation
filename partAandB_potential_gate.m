clc;
clear all;
no_of_red = 5; %Here we can change number of red agent 
no_of_blue = 5; %Here we can change number of blue agent
no_of_follower = 5;
dt = 0.1;
for i = 1:no_of_red 
    x_rand = randi([-50,-25]);
    y_rand = randi([-25, 0]);
    red(i).pos = [x_rand; y_rand];
    x_rand = randi([-20,20]);
    y_rand = randi([-20, 20]);
    red(i).goal = [x_rand; y_rand];
    red(i).velocity = 3;
    red(i).acceleration = 0;
    red(i).color = 'red';
end
list_of_red_goal = [red(1:no_of_red).goal];
x_rand = randi([-20, 20]);
y_rand = randi([-20,20]);
for i = 1:no_of_blue
    x_rand = randi([-20, 20]);
    y_rand = randi([-20,20]);
    blue(i).pos = [x_rand; y_rand];
    x_rand = randi([-50, -25]);
    y_rand = randi([0,25]);
    blue(i).goal = [x_rand; y_rand];
    blue(i).velocity = 1;
    blue(i).acceleration = 0;
    blue(i).color = 'blue';
end
list_of_blue_goal = [blue(1:no_of_blue).goal];

i = 12.5:0.5:25;
for j = 1:length(i)
    wallx_25(j).pos = [-25; i(j)];
    wallx_25_R = rectangle('Position', [(wallx_25(j).pos)' 0.5 0.5], 'Curvature', [0 1], 'Facecolor', 'k');
end
i = -25:0.5:25;
for j = 1:length(i)
    wally25(j).pos = [i(j); 25];
    wally25_R = rectangle('Position', [(wally25(j).pos)' 0.5 0.5], 'Curvature', [0 1], 'Facecolor', 'k');
end
i = -25:0.5:25;
for j = 1:length(i)
    wallx25(j).pos = [25; i(j)];
    wallx25_R = rectangle('Position', [(wallx25(j).pos)' 0.5 0.5], 'Curvature', [0 1], 'Facecolor', 'k');
end
i = -25:0.5:25;
for j = 1:length(i)
    wally_25(j).pos = [i(j);-25];
    wally_25_R = rectangle('Position', [(wally_25(j).pos)' 0.5 0.5], 'Curvature', [0 1], 'Facecolor', 'k');
end
i = -25:0.5:-12.5;
for j = 1:length(i)
    wallx1_25(j).pos = [-25; i(j)];
    wallx1_25_R = rectangle('Position', [(wallx1_25(j).pos)' 0.5 0.5], 'Curvature', [0 1], 'Facecolor', 'k');
end
axis([-50 50 -50 50])
k_caval = 3;
time = 0;
while (1)
    time = time + dt;
    %agent goal positon change
    %kid goal position change
    
    %agent and follower motion
    for i = 1:no_of_red
            list_pos = [red(1:no_of_red).pos blue(1:no_of_blue).pos wallx_25(1:25).pos wallx1_25(1:25).pos wallx25(1:101).pos wally25(1:101).pos wally_25(1:101).pos];
            red(i).acceleration = potential_field(i, list_of_red_goal,i,list_pos,5, 5);
            red(i).pos = movetodirection(red(i).pos, [1;1],red(i).velocity, red(i).acceleration, dt);
            
            red(i).velocity = red(i).acceleration + dt;
            red(i).R = rectangle('Position', [(red(i).pos)' 2.5 2.5], 'Curvature', [1 1], 'Facecolor', 'red');
    end
    for i = 1:no_of_blue
            list_pos = [red(1:no_of_red).pos blue(1:no_of_blue).pos wallx_25(1:25).pos wallx1_25(1:25).pos wallx25(1:101).pos wally25(1:101).pos wally_25(1:101).pos];
            blue(i).acceleration = potential_field(i+no_of_red, list_of_blue_goal,i,list_pos,5, 5);
            blue(i).pos = movetodirection(blue(i).pos, [1;1],blue(i).velocity, blue(i).acceleration, dt);
            blue(i).velocity = blue(i).acceleration + dt;
            
            blue(i).R = rectangle('Position', [(blue(i).pos)' 2.5 2.5], 'Curvature', [1 1], 'Facecolor', 'blue');
    end
    getframe();
  
    delete([red(1:no_of_red).R  blue(1:no_of_blue).R])
end