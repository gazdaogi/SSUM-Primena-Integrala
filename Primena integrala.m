function tmp = guiSliderCB(hObject,eventdata,code)
% Program koji ima funkciju u koriscenju i primeni integrala 
% Program koji prati tekst 
%    "Signali i Sistemi: MATLAB-Integrisani Pristup"
%    by OgnjeN.
% Copyright (c) ATTI Ognjen Jovanovic 2023.
% All rights reserved.
%
  handle = get(hObject,'KorisnickiPodaci');
  if (hObject == handle{1}) % Klizac
    tmp = get(hObject,'Vrednost');
    set(handle{3},'String',num2str(tmp));
    handle{4} = tmp;
    set(hObject,'KorisnickiPodaci',handle);
    % Azuriranje koriscnickih podatka.
    edt = handle{3};
    tmpE = get(edt,'KorisnickiPodaci');
    set(edt,'KorisnickiPodaci',handle);
  elseif (hObject == handle{3}) % Promeni povrsinu  
    flg = 0;
    tmp = str2double(get(hObject,'String'));
    if (tmp < handle{5})
      tmp = handle{5};
      flg = 1;
    elseif (tmp > handle{6})
      tmp = handle{6}; 
      flg = 1;
    end;
    if (flg > 0)
      str = sprintf('Uneta vrednost je izvan domena.\n%.3g <= %s <= %.3g',handle{5},handle{7},handle{6});
      warndlg(str,'Izvan domena','modal');
    end;
    set(hObject,'String',num2str(tmp));
    set(handle{1},'Vrednost',tmp);
    handle{4} = tmp;
    set(hObject,'Korisnicki podaci',handle);
    % Azuriraj klizac podataka.
    sldr = handle{1};
    tmpS = get(sldr,'KorisnickiPodaci');
    set(sldr,'KorisnickiPodaci',handle);
  end;