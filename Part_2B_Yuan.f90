program main
    implicit none
    real(8) :: A(2,2),W(2,2),WORK(5,5)
    character(1) :: JOBZ
    character(1) :: UPLO
    integer :: N,LDA,LWORK,INFO
    real(8) :: gstrength,dspe1,dspe2
    
    real(8) :: TBME11,TBME12,TBME21,TBME22
    
    JOBZ='V'
    UPLO="U"
    N=2
    LDA=2
    LWORK=5
    
    gstrength=1
    dspe1=1
    dspe2=2
    TBME11=(dspe1-1)*2-gstrength
    TBME22=(dspe2-1)*2-gstrength
    TBME12=-gstrength/2
    TBME21=-gstrength/2
    
    A=reshape((/TBME11,TBME12,TBME21,TBME22/),(/2,2/))    
    
    print *,A
    
    Call DSYEV(JOBZ,UPLO,N,A,LDA,W,WORK,LWORK,INFO)    
    
    
    
  
    print *,A
    print *,info
    print *,W
end program