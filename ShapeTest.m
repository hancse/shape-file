%% clear workspace
clear all
clc

%% Load the shape files
Tornadoes = shaperead('1950-2017-torn-aspath\1950-2017-torn-aspath.shp');
States = shaperead('states\states.shp');

%% colors
ColorMap = colormap(jet(6));
 
TornSpec = makesymbolspec('Line',...
 {'mag',0, 'Color',ColorMap(1,:)},...
 {'mag',1, 'Color',ColorMap(2,:)},...
 {'mag',2, 'Color',ColorMap(3,:)},...
 {'mag',3, 'Color',ColorMap(4,:)},...
 {'mag',4, 'Color',ColorMap(5,:)},...
 {'mag',5, 'Color',ColorMap(6,:)});

 %Set colormap for Fujita scale
ColorMap = colormap(jet(6));
TornSpec.ShapeType = 'Line';
for ii = 0:5
 TornSpec.Color{ii+1,1} = 'mag';
 TornSpec.Color{ii+1,2} = ii;
 TornSpec.Color{ii+1,3} = ColorMap(ii+1,:);
end

%% Plot the entire United States
% Top Plot - entire country
ax(1) = subplot(3,2,[1:4]);
h_states = mapshow(States, 'FaceColor', [1 1 1]);
h_torn = mapshow(ax(1), Tornadoes, 'SymbolSpec' ,TornSpec);
%h_torn = mapshow(ax(1), Tornadoes);
axis(ax(1),'equal');
ax(1).XLim = [-2600000,2400000];
ax(1).YLim = [-1900000,1500000];
title('Tornadoes (1950-2015)');
 
%% Legend Information, we will simulate a legend by create patch lines and
% hiding them so they do not appear on the plot
for ii = 0:5
 v_patch = [0 0; 1 0; 1 1; 0 1];
 f_patch = [1 2 3 4];
 h_patch(ii+1) = patch('Faces',f_patch,'Vertices',v_patch,...
 'FaceColor',ColorMap(ii+1,:), 'DisplayName', ['F' num2str(ii)]);
 h_patch(ii+1).Visible = 'off';
end
h_legend = legend('toggle');
h_legend.Location = 'south';
h_legend.Orientation = 'horizontal';
axis off

%% Add secondary plots
% Tornadoes Per Year
%ax(2) = subplot(3,2,5);
%Years = [Tornadoes.yr];
