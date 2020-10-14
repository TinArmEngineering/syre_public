% Copyright 2014
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

function dataSet = DrawAndSaveMachine(dataSet,filename,pathname)
% function dataSet = DrawPushMachine(handles,filename,pathname)

% if ~isfield(app,'dataSet')  % not launched from GUI_Syre
%     flagGUI=0;
%     dataSet=app;
% else                            % launched from GUI_Syre
%     flagGUI=1;
%     dataSet=app.dataSet;
% end

if nargin==1
    [filename,pathname] = uiputfile(['newmachine.fem'],'input machine name and location');
    if ~filename
        error('No file name selected');
    end
else
    filename = strrep(filename,'.mat','.fem');
end

[~, ~, geo, per, mat] = data0(dataSet);
RQ = dataSet.RQ;

%% ==== FIRST PART FROM FEMMFitnessX ======================================
% currentDir = pwd;

% RQ defines the candidate machine 
% [geo,gamma,mat] = interpretRQ(RQ,geo,mat);

% FemmProblem.ProbInfo.Frequency = 0;
% FemmProblem.ProbInfo.Precision = 1e-8;
% FemmProblem.ProbInfo.MinAngle = 15;
% FemmProblem.ProbInfo.LengthUnits = 'millimeters';
% FemmProblem.ProbInfo.Depth = geo.l;
% FemmProblem.Segments = [];
% FemmProblem.ArcSegments = [];
% FemmProblem.Nodes = [];
% FemmProblem.BoundaryProps = [];
% FemmProblem.Circuits = [];
% FemmProblem.BlockLabels = [];
% FemmProblem.PointProps = [];
eval_type = 'singt';

% FEMM
[geo,mat] = draw_motor_in_FEMM(geo,mat, pathname, filename);
mi_close, closefemm

geo.RQ = RQ;

filename = strrep(filename,'fem','mat');
dataSet.currentpathname = [pathname '\'];
dataSet.currentfilename = filename;
dataSet.slidingGap      = 1; % R347

% refresh GUI display data
% if flagGUI
%     set(app.currentMotFileName,'Value',filename);  % update display
% %     load([pathname filename]);


% end
dataSet.RQ = round(dataSet.RQ,4);
dataSet.currentpathname = pathname;
dataSet.currentfilename = filename;

geo = orderfields(geo);
per = orderfields(per);
dataSet = orderfields(dataSet);
mat = orderfields(mat);
save([pathname filename],'geo','per','dataSet','mat');

% cd(currentDir);
