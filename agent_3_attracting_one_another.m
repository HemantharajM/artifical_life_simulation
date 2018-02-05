%initialize the no of agent and axis length
no_of_agent = 3;
dt = 0.1;
axis([-5 15 -5 15]);
%Initialize the agent at random position.
for i = 1:3
    x_rand = randi([-5,15]);
    y_rand = randi([-5,15]);
    Agent(i).pos = [x_rand; y_rand];
    Agent(i).attraction = mod(i,3) + 1;
    Agent(i).velocity = 1;
    Agent(i).acceleration = 0;
end
