function posout = movetodirection(posin, direction, velocity, acceleration, dt)
    posout = posin + ((velocity + (acceleration * dt) ) * dt .* direction);
end