%initialize the no of agent and axis length
no_of_agent = 3;
dt = 0.1;
radius = 0.5;
axis([-5 15 -5 15]);
%Initialize the agent at random position.
for i = 1:no_of_agent
    x_rand = randi([-5,15]);
    y_rand = randi([-5,15]);
    Agent(i).pos = [x_rand; y_rand];
    Agent(i).attraction = mod(i,3) + 1;
    Agent(i).velocity = 1;
    Agent(i).acceleration = 0;
end

%time loop
time = 0;
while (1)
    time = 0 + dt;
    list_pos = [Agent(1:no_of_agent).pos];
    for i= 1:no_of_agent
        
        R(i) = rectangle('Position', [(Agent(i).pos' - radius) radius radius], 'Curvature', [1 1], 'Facecolor', 'blue'); 
    end
    
    getframe();
    delete(R(1:no_of_agent));
end
