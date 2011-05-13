%  UNWIND_0_180 - Unwind an angle until it is between 0_180 degrees
%
%  [angle] = unwind_0_180(angle_in)
%
%  This (obviously) assumes a 180 degree periodicity. Angle can be a scalar
%  or a vector. 
%
%  Created by James Wookey on 2007-05-08.
%
%===============================================================================
function [angle] = unwind_0_180(angle_in)
%===============================================================================
   angle = angle_in ;
   for i=1:1000 % should never reach this
      
%  ** check for completion
      ind = find(angle <= 0.0 | angle > 180.0) ;
      if isempty(ind), return, end % done

%     else refine: too small
      ind = find(angle<=0);
      if ~isempty(ind), angle(ind) = angle(ind) + 180 ; , end    

%     and too large      
      ind = find(angle>180); 
      if ~isempty(ind), angle(ind) = angle(ind) - 180 ; , end 
   end

%  if we got to here something is probably wrong:
error('UNWIND_0_180 completed 1000 iterations without angle reaching 0-180 deg')   
   
return
%===============================================================================
