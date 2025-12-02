function scientific_calculator()
    clc;
    close all;

    % --- MAIN WINDOW ---
    fig = figure("Name","Scientific Calculator",...
                 "Position",[400 200 350 400],...
                 "MenuBar","none",...
                 "NumberTitle","off");

    % --- DISPLAY ---
    displayBox = uicontrol(fig,"Style","edit",...
                "Position",[20 350 310 40],...
                "FontSize",14,"HorizontalAlignment","right");

    % --- BUTTON LABELS ---
    buttons = {
        "7","8","9","/","sin";
        "4","5","6","*","cos";
        "1","2","3","-","tan";
        "0",".","=","+","sqrt"
    };

    % --- BUTTON CREATION LOOP ---
    x = 20; y = 300; w = 50; h = 40;

    for r = 1:4
        for c = 1:5
            label = buttons{r,c};
            uicontrol(fig,"Style","pushbutton","String",label,...
                "Position",[x+(c-1)*60, y-(r-1)*50, w, h],...
                "FontSize",12,...
                "Callback", @(src,evt) press_button(label));
        end
    end

    % --- CLEAR BUTTON ---
    uicontrol(fig,"Style","pushbutton","String","C",...
        "Position",[260 100 70 40],"FontSize",12,...
        "BackgroundColor",[1 0.6 0.6],...
        "Callback", @(src,evt) set(displayBox,"String",""));

    % ----------- CALLBACK FUNCTION ------------
    function press_button(val)
        current = get(displayBox,"String");

        try
            if strcmp(val,"=")
                result = eval(current);
                set(displayBox,"String",num2str(result));

            elseif strcmp(val,"sin")
                result = sin(eval(current));
                set(displayBox,"String",num2str(result));

            elseif strcmp(val,"cos")
                result = cos(eval(current));
                set(displayBox,"String",num2str(result));

            elseif strcmp(val,"tan")
                result = tan(eval(current));
                set(displayBox,"String",num2str(result));

            elseif strcmp(val,"sqrt")
                result = sqrt(eval(current));
                set(displayBox,"String",num2str(result));

            else
                set(displayBox,"String",[current val]);
            end

        catch
            set(displayBox,"String","Error");
        end
    end
end
