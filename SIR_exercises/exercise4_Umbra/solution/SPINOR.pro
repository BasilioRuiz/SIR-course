pro SPINOR

inpath = '/home/brc/'

restore,'SPINOR_umb1565.sav'

window,2
!p.multi = [4,2,2]
cwpal
plot,spinor_wavelength,spinor_i,yr = [0,1.1],/ystyle,title='SPINOR_umb1565.sav'
oplot,spinor_wavelength,spinor_average_qsprofile,color = 2
;ver,spinor_wavelength(25),col=2 & ver,spinor_wavelength(45),col=2
ver,spinor_wavelength(186),col=3 & ver,spinor_wavelength(210),col=3
ver,spinor_wavelength(240),col=4 & ver,spinor_wavelength(260),col=4
ver,spinor_wavelength(300),col=5 & ver,spinor_wavelength(358),col=5
ver,spinor_wavelength(385),col=6 & ver,spinor_wavelength(417),col=6

plot,spinor_wavelength,spinor_q
;ver,spinor_wavelength(25),col=2 & ver,spinor_wavelength(45),col=2
ver,spinor_wavelength(186),col=3 & ver,spinor_wavelength(210),col=3
ver,spinor_wavelength(240),col=4 & ver,spinor_wavelength(260),col=4
ver,spinor_wavelength(300),col=5 & ver,spinor_wavelength(358),col=5
ver,spinor_wavelength(385),col=6 & ver,spinor_wavelength(417),col=6

plot,spinor_wavelength,spinor_u
;ver,spinor_wavelength(25),col=2 & ver,spinor_wavelength(45),col=2
ver,spinor_wavelength(186),col=3 & ver,spinor_wavelength(210),col=3
ver,spinor_wavelength(240),col=4 & ver,spinor_wavelength(260),col=4
ver,spinor_wavelength(300),col=5 & ver,spinor_wavelength(358),col=5
ver,spinor_wavelength(385),col=6 & ver,spinor_wavelength(417),col=6

plot,spinor_wavelength,spinor_v
;ver,spinor_wavelength(25),col=2 & ver,spinor_wavelength(45),col=2
ver,spinor_wavelength(186),col=3 & ver,spinor_wavelength(210),col=3
ver,spinor_wavelength(240),col=4 & ver,spinor_wavelength(260),col=4
ver,spinor_wavelength(300),col=5 & ver,spinor_wavelength(358),col=5
ver,spinor_wavelength(385),col=6 & ver,spinor_wavelength(417),col=6

;w1=(spinor_wavelength(25:45)*10-15588.264)*1000.         ;line 11
;in1=intarr(n_elements(w1))+11
;si1=spinor_i(25:45) & sq1=spinor_q(25:45) & su1=spinor_u(25:45) & sv1=spinor_v(25:45)
;str1=spinor_average_qsprofile(25:45)

w2=(spinor_wavelength(186:210)*10-15621.658)*1000.       ;line 10
in2=intarr(n_elements(w2))+10
si2=spinor_i(186:210) & sq2=spinor_q(186:210) & su2=spinor_u(186:210) & sv2=spinor_v(186:210)
str2=spinor_average_qsprofile(186:210)

w3=(spinor_wavelength(240:260)*10-15631.950)*1000        ;line 9
in3=intarr(n_elements(w3))+9
si3=spinor_i(240:260) & sq3=spinor_q(240:260) & su3=spinor_u(240:260) & sv3=spinor_v(240:260)
str3=spinor_average_qsprofile(240:260)

w4=(spinor_wavelength(300:358)*10-15645.020)*1000.       ;line 8 + 5,6
in4=intarr(n_elements(w4))+8
si4=spinor_i(300:358) & sq4=spinor_q(300:358) & su4=spinor_u(300:358) & sv4=spinor_v(300:358)
str4=spinor_average_qsprofile(300:358)

w5=(spinor_wavelength(385:417)*10-15662.018)*1000.       ;line 12, + 13
in5=intarr(n_elements(w5))+12
si5=spinor_i(385:417) & sq5=spinor_q(385:417) & su5=spinor_u(385:417) & sv5=spinor_v(385:417)
str5=spinor_average_qsprofile(385:417)

in=[in2,in3,in4,in5] & w=[w2,w3,w4,w5]
si=[si2,si3,si4,si5] & sq=[sq2,sq3,sq4,sq5] & su=[su2,su3,su4,su5] & sv=[sv2,sv3,sv4,sv5]
stri=[str2,str3,str4,str5] & strq=stri*0.

write_profiles,'SPINOR_umb1565.per',in,w,si,sq,su,sv
write_profiles,'SPINOR_stray.per',in,w,stri,strq,strq,strq


window,3,xs = 2*200,ys = 268*2
loadct,3,/silent
tvscl,congrid(spinor_ii,200,268*2.,/interp),0,0
loadct,39,/silent
tvscl,congrid(spinor_vv,200,268*2.,/interp),200,0
plots,[0,0]+spinor_px,[0,0]+spinor_py*2,/device,psym = 1,color = 240
plots,[0,0]+spinor_px+200,[0,0]+spinor_py*2,/device,psym = 1,color = 240


stop
end
