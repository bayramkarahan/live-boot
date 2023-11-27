build:
	: do nothing
install:
	mkdir -p ${DESTDIR}/etc/initramfs-tools/scripts/
	mkdir -p ${DESTDIR}/usr/libexec/
	mkdir -p ${DESTDIR}/etc/init.d/
	mkdir -p ${DESTDIR}/usr/share/initramfs-tools/hooks/
	install live-boot.script ${DESTDIR}/etc/initramfs-tools/scripts/live
	install live-boot.hook ${DESTDIR}/usr/share/initramfs-tools/hooks/live
	install live-config.initd ${DESTDIR}/etc/init.d/live-config
	install live-config.sh ${DESTDIR}/usr/libexec/live-config
