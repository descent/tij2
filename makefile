MID_FILES=tij2.ps tij2.ctx.dvi tij2.ctx.tex
TMP_FILES=*.ctx.toc *.ctx.aux *.ctx.xlg *.ctx.log *.ctx.lof *.ctx.lot cinput.bak *.ctx.out cinput.tex 

CTX=tij2.ctx intro.ctx  intro_obj.ctx  object.ctx  preface.ctx 


tij2.pdf:tij2.ps
	ps2pdf $<
tij2.ps:tij2.dvi
	dvips -o $@ $<
tij2.dvi:tij2.tex intro_obj.tex  intro.tex  object.tex  preface.tex
	latex $< ; latex $<



#tij2.ps:tij2.ctx.dvi
#	dvips -o $@ $<

#%tij2.ctx.dvi:tij2.ctx.tex
#	latex $< ; latex $<

#tij2.ctx.tex:${CTX}
#	cwtex $<


ifdef COMSPEC
# in windows
include ..\clean.mk
else
include ../clean.mk
endif

