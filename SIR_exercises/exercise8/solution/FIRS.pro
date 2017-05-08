pro FIRS

restore,'FIRS_fac1083.sav'

; we will no consider Q nor U
; Q has a lot a fringes
; U is very small <0.006 
; the line at 1082.7089 nm is a SiI  line (photospheric)
; the lines at 1083.03 y 1084.38 are He I lines (chromospheric)
; we only invert the Si I line

; we copy LINES2 from /home/brc/SIR/default/LINES2

window,1
!p.multi=[0,1,2]
i1=220 & i2=320 ; region of Si I lines
plot,firs_wavelength,firs_i & hor,1 & ver,firs_wavelength(i1) & ver,firs_wavelength(i2)
plot,firs_wavelength,firs_v & hor,0 & ver,firs_wavelength(i1) & ver,firs_wavelength(i2)

; perhaps we should rectify the continuum... but we can go ahead
x=(firs_wavelength(i1:i2)*10.-10827.089)*1000.
n=n_elements(x)
si=firs_i(i1:i2) & sv=firs_v(i1:i2) & sq=si*0. & su=sq
index=intarr(n)+7
write_profiles,'FIRS_Si1082.per',index,x,si,sq,su,sv

end
