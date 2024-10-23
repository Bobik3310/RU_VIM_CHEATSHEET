all: RU_VIM_CHEATSHEET.pdf

RU_VIM_CHEATSHEET.pdf: RU_VIM_CHEATSHEET.md
	pandoc -t latex --pdf-engine=xelatex -o $@ $<
