# Makefile to archive and compress folders, and to extract them

# Variables
MODELS_DIR = Models
DATA_DIR = Data
MODELS_ARCHIVE = $(RESOURCES_DIR)/Models.tar
DATA_ARCHIVE = $(RESOURCES_DIR)/Data.tar
MODELS_ZIP = $(MODELS_ARCHIVE).zip
DATA_ZIP = $(DATA_ARCHIVE).zip

# Archive and compress
archive:
	tar -cvf $(MODELS_ARCHIVE) $(MODELS_DIR)
	tar -cvf $(DATA_ARCHIVE) $(DATA_DIR)
	zip $(MODELS_ZIP) $(MODELS_ARCHIVE)
	zip $(DATA_ZIP) $(DATA_ARCHIVE)
	rm $(MODELS_ARCHIVE) $(DATA_ARCHIVE)

# Extract compressed files
extract:
	unzip $(MODELS_ZIP)
	unzip $(DATA_ZIP)
	tar -xvf $(MODELS_ARCHIVE)
	tar -xvf $(DATA_ARCHIVE)
	rm $(MODELS_ARCHIVE) $(DATA_ARCHIVE)

# Clean up zip files
clean:
	rm -f $(MODELS_ZIP) $(DATA_ZIP)