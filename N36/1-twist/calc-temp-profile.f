      program thermoanly
      Implicit none
      integer ::k,  nfrms,i,j, step
      integer, parameter :: iprint = 1
      integer, parameter :: ntempx  = 12  ! number of slices
      double precision, parameter :: Rgas = 0.001987 ! kcal mol-1 K-1 
      double precision, parameter :: NA = 6.022141e23 ! mol-1
      double precision, allocatable:: temp(:),
     $ CThot(:)
      double precision, allocatable::CTcold(:),fhot(:),fcold(:),
     $ vtdiff(:), CThot_pair(:), CThot_bond(:), CThot_ang(:), 
     $ CThot_ke(:), CThot_vir(:)
      double precision, allocatable:: rg(:), zpos(:)
      double precision, allocatable:: Jx(:), Jy(:), Jz(:)
      double precision, allocatable:: Jxconv(:), Jyconv(:), Jzconv(:)
      double precision :: avgtemp,avgke,avgpe,avgte,avg_CThot
      double precision :: avg_CTcold,avg_fhot,avg_fcold,avg_vtdiff,
     $ avg_ave, avg_pyy, avg_pzz, avg_pxy, avg_pxz, avg_pyz,
     $ avg_pvir,avg_ppair, avg_pang, avg_pbond, avg_pke, avgrg, avgrgsq
      double precision :: avg_zpos, runtime
      double precision :: instte,instCThot, insttemp
      double precision :: kappa, energyflux, tempgrad
      double precision :: insttesq, sigmaE, Cv
      double precision :: avginstte,avginsttesq, avginsttemp
      double precision :: dummy1, zzpos, ttemp
      double precision :: scale  



      open(unit=14,file='profile.dat',status='old')

      k=0
 10   k=k+1
      read(14,*,end=11) 
      go to 10
 11   k=k-1
      close(14)
      print*, 'number of lines', k
      nfrms = k
   
      !nfrms = nfrms-3 
      nfrms = nfrms/(ntempx+1)  
      print*, 'number of frames', nfrms

      allocate(temp(ntempx))
      allocate(zpos(ntempx))

      temp(:) = 0.0
      zpos(:) = 0.0

      open(unit=14,file='profile.dat',status='old')
      !Read(14,*)
      !Read(14,*)
      !Read(14,*)
      do i=1,nfrms
         Read(14,*)
         do j  =  1, ntempx
            Read(14,*)step,zzpos,dummy1,ttemp
            zpos(j) = zpos(j) + zzpos 
            temp(j) = temp(j) + ttemp 
         enddo
      enddo

      zpos(:) = zpos(:)/dble(nfrms) 
      temp(:) = temp(:)/dble(nfrms) 


      open(unit=11,file='average-profile.dat',status='unknown')


      do j  =  1, ntempx
         write(11,*) zpos(j) , temp(j)
      enddo



 901  format(i10, 2x, 6f25.15)

      End
