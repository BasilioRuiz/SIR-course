pro checking2,name_perIN,name_perOUT,stray_per   ; example:   checking2,'IBIS_penumb6173.per','penumbra_1.per','IBIS_stray.per'

read_profiles,name_perIN,in,x,si,sq,su,sv
read_profiles,name_perOUT,in1,x1,si1,sq1,su1,sv1

read_profiles,stray_per,ins,xs,is,qs,us,vs

!p.multi= [0,2,2]
loadct,39
cwpal

dw=where(si gt 0)

plot,si(dw) & oplot,si1(dw),col=2& oplot,is(dw),col=3
plot,sq(dw) & oplot,sq1(dw),col=2& oplot,qs(dw),col=3
plot,su(dw) & oplot,su1(dw),col=2& oplot,us(dw),col=3
plot,sv(dw) & oplot,sv1(dw),col=2& oplot,vs(dw),col=3

return
end
