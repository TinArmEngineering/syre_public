% Copyright 2020
%
%    Licensed under the Apache License, Version 2.0 (the "License");
%    you may not use this file except in compliance with the License.
%    You may obtain a copy of the License at
%
%        http://www.apache.org/licenses/LICENSE-2.0
%
%    Unless required by applicable law or agreed to in writing, dx
%    distributed under the License is distributed on an "AS IS" BASIS,
%    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%    See the License for the specific language governing permissions and
%    limitations under the License.

function plot_iron_prop(mat)

BackColor=[[0.6 0.8 1.0];[0.941 0.941 0.941]];
h0=figure();
set(h0, 'Units', 'centimeters', 'Position', [2 2 15 18]);
xpos=[0.02,0.3];
ypos=0.86;
w = 0.25;
h = 0.026;

% title
uicontrol('Parent',h0, ...
        'Units','normalized', ...
        'FontSize',12, ...
        'FontName','TimesNewRoman', ...
        'FontWeight','Bold', ...
        'Style','text',...
        'Position', [0.02 0.9 0.90 0.04],...
        'BackgroundColor','w', ...
        'String',mat.MatName);
ypos = ypos-0.03;
% category
ypos = ypos-0.03;
uicontrol('Parent',h0, ...
          'Units','normalized', ...
          'FontSize',9, ...
          'FontName','TimesNewRoman', ...
          'Style','text', ...
          'Position', [xpos(1) ypos w h], ...
          'BackgroundColor',BackColor(1,:), ...
          'String','Category:');

uicontrol('Parent',h0, ...
          'Units','normalized', ...
          'FontSize',9, ...
          'FontName','TimesNewRoman', ...
          'Style','text', ...
          'Position', [xpos(2) ypos w h], ...
          'BackgroundColor',BackColor(2,:), ...
          'String','Iron');

% mass density
ypos = ypos-0.03;
uicontrol('Parent',h0, ...
          'Units','normalized', ...
          'FontSize',9, ...
          'FontName','TimesNewRoman', ...
          'Style','text', ...
          'Position', [xpos(1) ypos w h], ...
          'BackgroundColor',BackColor(1,:), ...
          'String','Mass density [kg/m^3]');

uicontrol('Parent',h0, ...
          'Units','normalized', ...
          'FontSize',9, ...
          'FontName','TimesNewRoman', ...
          'Style','text', ...
          'Position', [xpos(2) ypos w h], ...
          'BackgroundColor',BackColor(2,:), ...
          'String',num2str(mat.kgm3));


% sigma yield
ypos = ypos-0.03;
uicontrol('Parent',h0, ...
          'Units','normalized', ...
          'FontSize',9, ...
          'FontName','TimesNewRoman', ...
          'Style','text', ...
          'Position', [xpos(1) ypos w h], ...
          'BackgroundColor',BackColor(1,:), ...
          'String','Yield strength [MPa]');

uicontrol('Parent',h0, ...
          'Units','normalized', ...
          'FontSize',9, ...
          'FontName','TimesNewRoman', ...
          'Style','text', ...
          'Position', [xpos(2) ypos w h], ...
          'BackgroundColor',BackColor(2,:), ...
          'String',num2str(mat.sigma_max));

% loss coeff
ypos = ypos-0.03;
uicontrol('Parent',h0, ...
          'Units','normalized', ...
          'FontSize',9, ...
          'FontName','TimesNewRoman', ...
          'Style','text', ...
          'Position', [xpos(1) ypos w h], ...
          'BackgroundColor',BackColor(1,:), ...
          'String','alpha (loss coeff.)');

uicontrol('Parent',h0, ...
          'Units','normalized', ...
          'FontSize',9, ...
          'FontName','TimesNewRoman', ...
          'Style','text', ...
          'Position', [xpos(2) ypos w h], ...
          'BackgroundColor',BackColor(2,:), ...
          'String',num2str(mat.alpha));

ypos = ypos-0.03;

uicontrol('Parent',h0, ...
          'Units','normalized', ...
          'FontSize',9, ...
          'FontName','TimesNewRoman', ...
          'Style','text', ...
          'Position', [xpos(1) ypos w h], ...
          'BackgroundColor',BackColor(1,:), ...
          'String','Kh (loss coeff.)');

uicontrol('Parent',h0, ...
          'Units','normalized', ...
          'FontSize',9, ...
          'FontName','TimesNewRoman', ...
          'Style','text', ...
          'Position', [xpos(2) ypos w h], ...
          'BackgroundColor',BackColor(2,:), ...
          'String',num2str(mat.kh));

ypos = ypos-0.03;

uicontrol('Parent',h0, ...
          'Units','normalized', ...
          'FontSize',9, ...
          'FontName','TimesNewRoman', ...
          'Style','text', ...
          'Position', [xpos(1) ypos w h], ...
          'BackgroundColor',BackColor(1,:), ...
          'String','Ke (loss coeff.)');

uicontrol('Parent',h0, ...
          'Units','normalized', ...
          'FontSize',9, ...
          'FontName','TimesNewRoman', ...
          'Style','text', ...
          'Position', [xpos(2) ypos w h], ...
          'BackgroundColor',BackColor(2,:), ...
          'String',num2str(mat.ke));

ypos = ypos-0.03;

uicontrol('Parent',h0, ...
          'Units','normalized', ...
          'FontSize',9, ...
          'FontName','TimesNewRoman', ...
          'Style','text', ...
          'Position', [xpos(1) ypos w h], ...
          'BackgroundColor',BackColor(1,:), ...
          'String','beta (loss coeff.)');

uicontrol('Parent',h0, ...
          'Units','normalized', ...
          'FontSize',9, ...
          'FontName','TimesNewRoman', ...
          'Style','text', ...
          'Position', [xpos(2) ypos w h], ...
          'BackgroundColor',BackColor(2,:), ...
          'String',num2str(mat.beta));

% B-H curve
ypos = ypos-0.03;
hax=axes('Units','Normalized','Position',[0.5-ypos*0.8*0.5,ypos*0.2,ypos*0.8,ypos*0.8]);
set(hax,'XGrid','on',...
        'YGrid','on',...
        'XColor',[0 0 0],...
        'YColor',[0 0 0],...
        'Box','on',...
        'NextPlot','add',...
        'LineWidth',1);
plot(mat.BH(:,2),mat.BH(:,1),'LineWidth',1.5);
xlabel('H [A/m]')
ylabel('B [T]')