% Copyright 2020
%
%    Licensed under the Apache License, Version 2.0 (the "License");
%    you may not use this file except in compliance with the License.
%    You may obtain a copy of the License at
%
%        http://www.apache.org/licenses/LICENSE-2.0
%
%    Unless required by applicable law or agreed to in writing, software
%    distributed under the License is distributed on an "AS IS" BASIS,
%    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%    See the License for the specific language governing permissions and
%    limitations under the License.

function savePrintFigure(hfig)

if nargin()==0
    hfig=gcf;
    flagClose=1;
else
    flagClose=0;
end

figname=get(hfig,'FileName');
if ~isempty(figname)
    saveas(hfig,figname)
    print(hfig,[figname(1:end-4) '.png'],'-dpng','-r300')
    % print(hfig,[figname(1:end-4) '.eps'],'-depsc')
    % print(hfig,[figname(1:end-4) '.pdf'],'-dpdf')
    
    disp(['Figure saved in: ' figname])

    if flagClose==1
        close(hfig);
    end
else
    warning('off','backtrace')
    warning('Figure filename not set. Figures not saved!!!')
    warning('on','backtrace')
end
