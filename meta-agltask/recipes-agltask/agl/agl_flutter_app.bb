DESCRIPTION = "AGL Flutter App"
LICENSE = "MIT"


#SRC_URI = "file://home/vboxuser/agl/flutter_app/agltask/"
SRC_URI = "https://github.com/aparna534/AGLTASK"

S = "${WORKDIR}/git"

do_compile() {
	flutter build  linux 
}


do_install() {
	install -d ${D}${bindir}
	install -m 0755 ${S}/build/linux/x64/release/bundle/* ${D}${bindir}

}

FILES_${PN} += "${bindir}"




