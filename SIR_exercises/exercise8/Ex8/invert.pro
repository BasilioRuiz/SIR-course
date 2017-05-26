pro invert

; procedure to invert the profiles FIRS1.per ....
n=5 ; number of profiles

for i=0,n-1 do begin
  name='FIRS'+strtrim(string(i+1),2)
  
  name_obs=name+'.per'
  name_mod1=name+'_1.mod' & name_mod2=name+'_2.mod' 
  name_per1=name+'_1.per' & name_per2=name+'_2.per' 
  name_err1=name+'_1.err' & name_err2=name+'_2.err' 
  
  spawn,'cp '+name_obs+' FIRS.per'
  spawn,'echo FIRS.trol | $_program/sir.x'
  
  spawn,'cp guess1_1.mod '+name_mod1 & spawn,'cp guess1_2.mod '+name_mod2
  spawn,'cp guess1_1.per '+name_per1 & spawn,'cp guess1_2.per '+name_per2
  spawn,'cp guess1_1.err '+name_err1 & spawn,'cp guess1_2.err '+name_err2
  
endfor

return
end
