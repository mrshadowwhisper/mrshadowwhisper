CURL=curl
GREP=grep
RM=rm

README_TMP=readme.md
IMAGE_URL=https://api.roadmap.sh/v1-badge/long/6439b80711a85692d8943a6b?variant=dark

revalidate_cache:
	$(CURL) -s $(IMAGE_URL) > $(README_TMP)
	$(GREP) -Eo '<img src="[^"]+"' $(README_TMP) | $(GREP) $(IMAGE_URL) | $(GREP) -Eo 'https[^"]+' | xargs -I {} $(CURL) -w "\n" -s -X PURGE {}
	$(RM) $(README_TMP)
