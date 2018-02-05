function total_force = potential_field(agent_no, goal_no, list_pos,katt, krep)
    %finding the agent position and goal position
    goal_pos = list_pos(:,goal_no); 
    agent_pos = list_pos(:,agent_no);
    
    %find attractive force
    vec_toward_goal = (goal_pos - agent_pos);
    unit_vec_toward_goal = (vec_toward_goal)./(sqrt((vec_toward_goal') * (vec_toward_goal)));
    attractive_force = katt * unit_vec_toward_goal;
    
    %find repulsive force
    no_of_agent = length(list_pos);
    repulsive_force = [0;0];
    for i = 1:no_of_agent
        if i ~= agent_no && i ~= goal_no
            obstacle_pos = list_pos(:,i);
            vec_opposed_obstacle = (agent_pos - obstacle_pos);
            unit_vec_opposed_obstacle = vec_opposed_obstacle ./ ((vec_opposed_obstacle' * vec_opposed_obstacle).^1.5);
            repulsive_force = repulsive_force + (krep * unit_vec_opposed_obstacle);
        end
    end
    
    %find the total force
    total_force = repulsive_force + attractive_force;
end