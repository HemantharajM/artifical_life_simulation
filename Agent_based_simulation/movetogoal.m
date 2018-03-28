function [posout, unitvec_to_goal] = movetogoal(posin, goal, velocity, acceleration, dt)
    direction_toward_goal = (goal - posin);
    unitvec_to_goal = (direction_toward_goal) ./ (sqrt(direction_toward_goal' * direction_toward_goal)); 
    if (direction_toward_goal' * direction_toward_goal) > (velocity * dt)
        posout = posin + ((velocity + (acceleration .* dt)) .* dt ) .* unitvec_to_goal;
    else 
        posout = posin;
    end
end
    