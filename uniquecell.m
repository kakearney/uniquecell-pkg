function [c, aidx, cidx] = uniquecell(x)
%UNIQUECELL Find unique cell elements in an array
%
% Finds unique elements in a cell array, when each cell can contain any
% data type. Syntax is identical to unique.


if ~iscell(x)
    error('Input must be cell array');
end

[ii,jj] = meshgrid(1:numel(x));
iseq = arrayfun(@(a,b) isequal(x(a),x(b)), ii, jj);

G = graph(iseq);
cidx = conncomp(G);
aidx = arrayfun(@(ii) find(cidx==ii,1,'first'), 1:max(cidx));
c = x(aidx);
