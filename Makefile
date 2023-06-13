CURL=curl
GREP=grep
GIT=git
CD=cd

README_TMP=readme.html
USER=mrshadowwhisper
REPO=mrshadowwhisper

purge:
	$(CURL) -s https://github.com/$(USER)/$(REPO)/blob/master/README.md > $(README_TMP)
	$(GREP) -Eo '<img src="[^"]+"' $(README_TMP) | $(GREP) api | $(GREP) -Eo 'https[^"]+' | xargs -I {} $(CURL) -w "\n" -s -X PURGE {}
