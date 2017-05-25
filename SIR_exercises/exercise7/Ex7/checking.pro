pro checking,name_perIN,name_perOUT   ; example:   checking,'IBIS_penumb6173.per','penumbra_2.per'

read_profiles,name_perIN,in,x,si,sq,su,sv
read_profiles,name_perOUT,in1,x1,si1,sq1,su1,sv1


!p.multi= [0,2,2]
loadct,39
cwpal

dw=where(si gt 0)

plot,si(dw) & oplot,si1(dw),col=2
plot,sq(dw) & oplot,sq1(dw),col=2
plot,su(dw) & oplot,su1(dw),col=2
plot,sv(dw) & oplot,sv1(dw),col=2

return
end
