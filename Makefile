ifeq ($(OS),Windows_NT)
	platform = x86_64-win64
	exe = ".exe"
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
		platform = x86_64-linux
    endif
    ifeq ($(UNAME_S),Darwin)
		platform = x86_64-darwin
    endif
endif

lazbuild = lazbuild

creosource = Components/CreoSource/lib/$(platform)/creosource.compiled
eccontrols = Components/ecc_0-9-6-10_16-06-15/EC_Controls/lib/$(platform)/eccontrols.compiled
installpkg = Components/HSButton0.9/HSButton/lib/$(platform)/installpkg.compiled
bgrabitmappack = Components/bgrabitmap-master/bgrabitmap/lib/$(platform)/3.0.4/BGRABitmapPack.compiled
richmemopackage = Components/richmemo/lib/$(platform)/richmemopackage.compiled
uecontrols = Components/ueControls_v6.0/lib/$(platform)/uEControls.compiled

smartset = 'SmartSet FSEdge/SmartSet App-Freestyle (PC)'$(exe)

all: $(smartset)

$(smartset): $(creosource) $(eccontrols) $(installpkg) $(richmemopackage) $(uecontrols)
	$(lazbuild) "SmartSet FSEdge/SmartSetFSEdge.lpi"

$(uecontrols):
	$(lazbuild) Components/ueControls_v6.0/uecontrols.lpk

$(richmemopackage):
	$(lazbuild) Components/richmemo/richmemopackage.lpk

$(bgrabitmappack):
	$(lazbuild) Components/bgrabitmap-master/bgrabitmap/bgrabitmappack.lpk

$(creosource) : $(bgrabitmappack)
	$(lazbuild) Components/CreoSource/creosource.lpk

$(eccontrols):
	$(lazbuild) Components/ecc_0-9-6-10_16-06-15/EC_Controls/eccontrols.lpk

$(installpkg):
	$(lazbuild) Components/HSButton0.9/HSButton/installpkg.lpk
