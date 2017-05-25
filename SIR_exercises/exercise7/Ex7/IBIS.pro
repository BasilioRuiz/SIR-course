@ introduce_points

pro IBIS

restore,'IBIS_penumb6173.sav'

x=(ibis_wavelength-6173.3356)*1000. ; wave in mA from the center of the line

; x goes from -235.349 to 304.651
; You can see that x it is not equi-spaced at first it is 30 mA and then 20.mA
; then we will interpolate to a new equi-spaced grid, but we will write -1 in the new points

n1=nint((304.651+235.349)/10.)+1  ;the number of points of the new grid
x1=findgen(n1)*10.0-235.349

introduce_points,x,i,q,u,v,x1,i1,q1,u1,v1
index1=intarr(n1)+7                   ; the index of the line 6173 in LINES1 file
write_profiles,'IBIS_penumb6173.per',index1,x1,i1,q1,u1,v1

; the stray-light: The stray profile is very narrow: we do not consider it
; istr=average_qsprofile & qstr=istr*0. & ustr=qstr & vstr=qstr
; introduce_points,x,istr,qstr,ustr,vstr,x1,istr1,qstr1,ustr1,vstr1
; write_profiles,'IBIS_stray.per',index1,x1,istr1,qstr1,ustr1,vstr1

end
