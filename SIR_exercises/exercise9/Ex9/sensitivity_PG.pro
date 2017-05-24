@ read_RF_nomag
@ Pgderivatives

pro sensitivity_PG   

spawn,'echo RF.trol | /home/brc/SIR/program/sir.x'  ;writing the RF to T & Pg from guess_4.mod

read_RF_nomag,'guess_4.rt',rt,ntau,nlam             ; (1104, 73) 1104 wavelengths and 73 optical deptss
read_RF_nomag,'guess_4.rpe',rpe,ntau,nlam

read_model,'TandPgVzperturb.mod',logtau,Treal,Pereal,mic,h,vzreal,g,fi,zreal,pgreal,rhoreal
read_model,'guess_4.mod',logtau,Tinv,Peinv,mic,h,vzinv,g,fi,zinv,pginv,rhoinv

; We evaluate the Response function to Pg (to realtive perturbations):
; RPg(ilam,*)=rpe(ilam,*)/dlogPgdPe+rt(ilam,*)/dlogPgdT
; so we need first to evaluate the derivatives of logPg versus T and Pe 

dlogPgdT=fltarr(ntau) & dlogPgdPe=fltarr(ntau)
for itau=0,ntau-1 do begin
  ti=Tinv(itau)
  pei=Peinv(itau)
  Pgderivatives,ti,pei,pgi,dlogPgdTi,dlogPgdPei
  dlogPgdT(itau)=dlogPgdTi
  dlogPgdPe(itau)=dlogPgdPei
endfor

Rpg=rt ;Relative response function to Pg perturbations
for ilam=0,nlam-1 do RPg(ilam,*)=rpe(ilam,*)/dlogPgdPe+rt(ilam,*)/dlogPgdT

; I evaluate the maximum sensitivity for every lambda. As we are interested of the sensitivity to relative 
; perturpations we must multiply the RF for the parameter
RTmax=fltarr(ntau)
RPgmax=fltarr(ntau)
for itau=0,ntau-1 do RTmax(itau)=max(abs(rt(*,itau)))*Tinv(itau)
for itau=0,ntau-1 do Rpgmax(itau)=max(abs(Rpg(*,itau)))

; Then, a perturbation of a 10% in Pg produce a maximum change of around 1.e-4 in the I profile
; We will need a signal to noise ratio better to 1.e3 in order to find the Pe

cwpal
!p.multi=[0,1,2]
!p.charsize=1.5

; The reponse for a 10% perturbation would be
plot,logtau,0.1*Rtmax,xrange=[-5,1],xtitle='log!7s!3',ytitle='Relative RF'
oplot,logtau,10*0.1*Rpgmax,col=2  ;I'm multiplying Rpgmax by 10 to visualize
ver,-1.4,lin=2,col=2
hor,0.027,lin=2,col=2
xyouts,-1,0.03,'R!dT!n'
xyouts,-2.7,0.012,'10*R!dPg!n',col=2

;the maximum of Rpg it is around logtau=-1.4
; Then the perturbation of Stokes I produced by a 10% of Pg perturbation it has
; a maximum of 0.0027, it implies that we need a least SN=1000. to see this perturbation over the noise

plot,logtau,alog10(pgreal),yrange=[2,6],xrange=[-5,1],xtitle='log!7s!3',ytitle='log Pg'
oplot,logtau,alog10(pginv),col=2
ver,-1.4,lin=2,col=2
xyouts,0.5,4.5,'INVERTED',COL=2
xyouts,0.5,5.7,'ORIGINAL'

return
end

