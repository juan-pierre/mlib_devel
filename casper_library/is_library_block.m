%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%   Center for Astronomy Signal Processing and Electronics Research           %
%   http://seti.ssl.berkeley.edu/casper/                                      %
%   Copyright (C) 2006 David MacMahon, Aaron Parsons                          %
%                                                                             %
%   This program is free software; you can redistribute it and/or modify      %
%   it under the terms of the GNU General Public License as published by      %
%   the Free Software Foundation; either version 2 of the License, or         %
%   (at your option) any later version.                                       %
%                                                                             %
%   This program is distributed in the hope that it will be useful,           %
%   but WITHOUT ANY WARRANTY; without even the implied warranty of            %
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             %
%   GNU General Public License for more details.                              %
%                                                                             %
%   You should have received a copy of the GNU General Public License along   %
%   with this program; if not, write to the Free Software Foundation, Inc.,   %
%   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.               %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function tf=is_library_block(blk)
% Returns true if blk resides in a block diagram library.
%
% tf = is_library_block( blk )
%
% blk - The block whose residency is being checked
%
% tf = True is blk lives in a block diagram library

  % Prevent infinite loops
  limit=25;

  % Find top-level
  top=blk;
  while ~strcmp(get_param(top,'Type'),'block_diagram') && limit > 0
    top=get_param(top,'Parent');
    limit=limit-1;
  end

  % Don't munge if top is a "block_diagram" and
  % and its BlockDiagramType is "library"
  if strcmp(get_param(top,            'Type'),'block_diagram') ...
  && strcmp(get_param(top,'BlockDiagramType'),'library')
    tf=true;
  else
    tf=false;
  end
