pro IBIS_data

restore,'IBIS_penumb6173.sav'

set_plot,'ps'
device,filename='IBIS_prof.eps',/encapsulated,/color

!p.multi = [4,2,2]
!p.charsize=0.75
cwpal
plot,ibis_wavelength,i,yr = [0,1.1],/ystyle,title='IBIS_penumb6173',psym=-1,xtitle='Wavelength [A]',ytitle='Stokes I'
oplot,fts_lam,fts_data,line=2,col=2

xyouts,0.205,0.9,'FTS',/normal,col=2
;oplot,ibis_wavelength,average_qsprofile,color = 80
plot,ibis_wavelength,q,psym=-1,xtitle='Wavelength [A]',ytitle='Stokes Q' & hor,0
plot,ibis_wavelength,u,psym=-1,xtitle='Wavelength [A]',ytitle='Stokes U' & hor,0
plot,ibis_wavelength,v,psym=-1,xtitle='Wavelength [A]',ytitle='Stokes V' & hor,0
device,/close

device,filename='IBIS_ima.eps',/encapsulated,/color,bits_per_pixel=8
!p.multi=[0,2,1]
!p.charsize=0.4
loadct,3
tvframe,ii<1.25>0.3,/bar,/sample,/aspect,charsize=0.6
plots,px,py,psym=1
loadct,1
tvframe,vv,/bar,/sample,/aspect,charsize=0.6
cwpal
plots,px,py,psym=1,col=2
device,/close

end
