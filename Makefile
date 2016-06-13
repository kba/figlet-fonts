FONTDIR = $(shell figlet -I2)
FONTFILES = $(shell find -name '*.flf' -o -name *.flc *.tlf)

install:
	find . -regex '.*\(flf\|flc\|tlf\)$$' -exec cp -bt "$(FONTDIR)" "{}" \;

uninstall:
	find . -regex '.*\(flf\|flc\|tlf\)$$'|while read i;do \
		rm -rf "$(FONTDIR)/$$i"; \
		if [ -e "$(FONTDIR)/$$i~" ];then mv "$(FONTDIR)/$$i~" "$(FONTDIR)/$$i";fi; \
	done
