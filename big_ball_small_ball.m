function ball_skills_game
    % Initialize the game figure
    fig = figure('KeyPressFcn', @keyPressHandler, 'Name', 'Ball Skills Game');
    axis equal;
    axis([0 100 0 100]);
    hold on;

    % Create the ball
    ball = rectangle('Position', [50, 50, 5, 5], 'Curvature', [1, 1], 'FaceColor', 'r');

    % Create some obstacles
    obstacle1 = rectangle('Position', [30, 30, 10, 10], 'FaceColor', 'b');
    obstacle2 = rectangle('Position', [70, 70, 10, 10], 'FaceColor', 'b');

    % Create a goal
    goal = rectangle('Position', [90, 90, 5, 5], 'FaceColor', 'g');

    % Initialize ball position
    ballPos = [50, 50];

    % Function to handle key presses
    function keyPressHandler(~, event)
        switch event.Key
            case 'uparrow'
                ballPos(2) = ballPos(2) + 1;
            case 'downarrow'
                ballPos(2) = ballPos(2) - 1;
            case 'leftarrow'
                ballPos(1) = ballPos(1) - 1;
            case 'rightarrow'
                ballPos(1) = ballPos(1) + 1;
        end
        % Update ball position
        set(ball, 'Position', [ballPos, 5, 5]);

        % Check for collision with obstacles
        if checkCollision(ball, obstacle1) || checkCollision(ball, obstacle2)
            disp('Collision!');
        end

        % Check for reaching the goal
        if checkCollision(ball, goal)
            disp('Goal reached!');
            close(fig);
        end
    end

    % Function to check collision between two rectangles
    function collision = checkCollision(rect1, rect2)
        pos1 = get(rect1, 'Position');
        pos2 = get(rect2, 'Position');
        collision = pos1(1) < pos2(1) + pos2(3) && ...
                    pos1(1) + pos1(3) > pos2(1) && ...
                    pos1(2) < pos2(2) + pos2(4) && ...
                    pos1(2) + pos1(4) > pos2(2);
    end
end