Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3692336wrx;
        Tue, 16 Apr 2019 02:14:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzP9v6YIGP4nk+edwnGviMhRx3Mx45WT8itrZSyznnJ2jqK65PxGry6C4pnq5GrnaWO0AUa
X-Received: by 2002:a5d:4a8d:: with SMTP id o13mr38766006wrq.209.1555406089730;
        Tue, 16 Apr 2019 02:14:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555406089; cv=none;
        d=google.com; s=arc-20160816;
        b=ZlbJ6zTXjKWYkKiaAYW/J1nKRWNlQb4mEdTVCl4nIsQ97Nrqii0aHGkIQAACYooa4S
         oBqb7huYpNIeiQ1Wy8bS7R63HpDLesSMuNMUGn8388OPl8yoVagerrHZlpv0ahEPqrQA
         A3FAADArdJlQRGxxl200Z849Jv9p5w57DtUiUJueuI9sFXzu2YPpAKBLhP7sZbfD45XO
         w1Yia0qm7Y0cFuTWqMNMlZdj4uPykKMXQVvtY2V6VpSgt1/vKEGewGyH8Y5JkvVzuzIq
         056Bf/Zk+JEZZn6+Ezi5FxeZTBTX8yRGCDUDnR0SgqoRc4i0Nj4WcnNwFMR5quzFlexA
         o2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=BQW0SOqx2YbKdrmIYZJLg/NDBh3kypbgssFsYSG1usA=;
        b=rZm2nv87xKkQQFU2/RoHA+ofnXTT1bxXjBuhIMz+q17pzZyF3AtXJQH9vfA3nQRWWq
         oHhKlMUyXyAOYq/SQWNwIbNW0/eKxMRRK8yq2x5mX1ouZ+nlAmYZL4SYcGGGboCMgojT
         8sUSjDd2sE+QYhcVnprvGn71ZiCDJAqI1FyyOUVhbh1uo/2zARKCItV4Y3WwoR4uLj9n
         iiQt7bZQU/eLhPMcr8N6wCcyY71vHGSxQ+isw5H1vmdET59Zs+iP7sZJ5+dJ9O60oe7V
         qmwdDTRYCX6fWMpA1nwfdpxYzul0PTPLaweQ8WAkCfm5t/vvawHsRfG2vuJlu7nouEet
         QT/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9si34210182wrr.33.2019.04.16.02.14.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 02:14:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33551 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGKAy-0004zL-Gr
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 05:14:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hGKA7-0004Nv-Cl
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 05:13:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hGKA5-0004Sf-EP
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 05:13:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51386)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hGKA5-0004SM-4c; Tue, 16 Apr 2019 05:13:53 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63FFA8665D;
	Tue, 16 Apr 2019 09:13:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98A465D707;
	Tue, 16 Apr 2019 09:13:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 230D71132B6C; Tue, 16 Apr 2019 11:13:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 11:13:48 +0200
Message-Id: <20190416091348.26075-4-armbru@redhat.com>
In-Reply-To: <20190416091348.26075-1-armbru@redhat.com>
References: <20190416091348.26075-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 16 Apr 2019 09:13:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 3/3] hw/arm/virt: Support firmware
 configuration with -blockdev
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-block@nongnu.org,
	philmd@redhat.com, mreitz@redhat.com, qemu-arm@nongnu.org,
	lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7+UY/nCrnaAd

The ARM virt machines put firmware in flash memory.  To configure it,
you use -drive if=3Dpflash,unit=3D0,... and optionally -drive
if=3Dpflash,unit=3D1,...

Why two -drive?  This permits setting up one part of the flash memory
read-only, and the other part read/write.  It also makes upgrading
firmware on the host easier.  Below the hood, we get two separate
flash devices, because we were too lazy to improve our flash device
models to support sector protection.

The problem at hand is to do the same with -blockdev somehow, as one
more step towards deprecating -drive.

We recently solved this problem for x86 PC machines, in commit
ebc29e1beab.  See the commit message for design rationale.

This commit solves it for ARM virt basically the same way: new machine
properties pflash0, pflash1 forward to the onboard flash devices'
properties.  Requires creating the onboard devices in the
.instance_init() method virt_instance_init().  The existing code to
pick up drives defined with -drive if=3Dpflash is replaced by code to
desugar into the machine properties.

There are a few behavioral differences, though:

* The flash devices are always present (x86: only present if
  configured)

* Flash base addresses and sizes are fixed (x86: sizes depend on
  images, mapped back to back below a fixed address)

* -bios configures contents of first pflash (x86: -bios configures ROM
   contents)

* -bios is rejected when first pflash is also configured with -machine
   pflash0=3D... (x86: bios is silently ignored then)

* -machine pflash1=3D... does not require -machine pflash0=3D... (x86: it
   does).

The actual code is a bit simpler than for x86 mostly due to the first
two differences.

Before the patch, all the action is in create_flash(), called from the
machine's .init() method machvirt_init():

    main()
        machine_run_board_init()
            machvirt_init()
                create_flash()
                    create_one_flash() for flash[0]
                        create
                        configure
                            includes obeying -drive if=3Dpflash,unit=3D0
                        realize
                        map
                        fall back to -bios
                    create_one_flash() for flash[1]
                        create
                        configure
                            includes obeying -drive if=3Dpflash,unit=3D1
                        realize
                        map
                    update FDT

To make the machine properties work, we need to move device creation
to its .instance_init() method virt_instance_init().

Another complication is machvirt_init()'s computation of
@firmware_loaded: it predicts what create_flash() will do.  Instead of
predicting what create_flash()'s replacement virt_firmware_init() will
do, I decided to have virt_firmware_init() return what it did.
Requires calling it a bit earlier.

Resulting call tree:

    main()
        current_machine =3D object_new()
            ...
                virt_instance_init()
                    virt_flash_create()
                        virt_flash_create1() for flash[0]
                            create
                            configure: set defaults
                            become child of machine [NEW]
                            add machine prop pflash0 as alias for drive [=
NEW]
                        virt_flash_create1() for flash[1]
                            create
                            configure: set defaults
                            become child of machine [NEW]
                            add machine prop pflash1 as alias for drive [=
NEW]
        for all machine props from the command line: machine_set_property=
()
            ...
                property_set_alias() for machine props pflash0, pflash1
                    ...
                        set_drive() for cfi.pflash01 prop drive
                            this is how -machine pflash0=3D... etc set
        machine_run_board_init(current_machine);
            virt_firmware_init()
                pflash_cfi01_legacy_drive()
                    legacy -drive if=3Dpflash,unit=3D0 and =3D1 [NEW]
                virt_flash_map()
                    virt_flash_map1() for flash[0]
                        configure: num-blocks
                        realize
                        map
                    virt_flash_map1() for flash[1]
                        configure: num-blocks
                        realize
                        map
                fall back to -bios
            virt_flash_fdt()
                update FDT

You have L=C3=A1szl=C3=B3 to thank for making me explain this in detail.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Laszlo Ersek <lersek@redhat.com>
---
 hw/arm/virt.c         | 198 +++++++++++++++++++++++++++---------------
 include/hw/arm/virt.h |   2 +
 2 files changed, 130 insertions(+), 70 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ce2664a30b..3b7b5eb429 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -30,6 +30,7 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/option.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/arm/arm.h"
@@ -871,25 +872,19 @@ static void create_virtio_devices(const VirtMachine=
State *vms, qemu_irq *pic)
     }
 }
=20
-static void create_one_flash(const char *name, hwaddr flashbase,
-                             hwaddr flashsize, const char *file,
-                             MemoryRegion *sysmem)
+#define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
+
+static PFlashCFI01 *virt_flash_create1(VirtMachineState *vms,
+                                        const char *name,
+                                        const char *alias_prop_name)
 {
-    /* Create and map a single flash device. We use the same
-     * parameters as the flash devices on the Versatile Express board.
+    /*
+     * Create a single flash device.  We use the same parameters as
+     * the flash devices on the Versatile Express board.
      */
-    DriveInfo *dinfo =3D drive_get_next(IF_PFLASH);
     DeviceState *dev =3D qdev_create(NULL, TYPE_PFLASH_CFI01);
-    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
-    const uint64_t sectorlength =3D 256 * 1024;
=20
-    if (dinfo) {
-        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo),
-                            &error_abort);
-    }
-
-    qdev_prop_set_uint32(dev, "num-blocks", flashsize / sectorlength);
-    qdev_prop_set_uint64(dev, "sector-length", sectorlength);
+    qdev_prop_set_uint64(dev, "sector-length", VIRT_FLASH_SECTOR_SIZE);
     qdev_prop_set_uint8(dev, "width", 4);
     qdev_prop_set_uint8(dev, "device-width", 2);
     qdev_prop_set_bit(dev, "big-endian", false);
@@ -898,41 +893,41 @@ static void create_one_flash(const char *name, hwad=
dr flashbase,
     qdev_prop_set_uint16(dev, "id2", 0x00);
     qdev_prop_set_uint16(dev, "id3", 0x00);
     qdev_prop_set_string(dev, "name", name);
+    object_property_add_child(OBJECT(vms), name, OBJECT(dev),
+                              &error_abort);
+    object_property_add_alias(OBJECT(vms), alias_prop_name,
+                              OBJECT(dev), "drive", &error_abort);
+    return PFLASH_CFI01(dev);
+}
+
+static void virt_flash_create(VirtMachineState *vms)
+{
+    vms->flash[0] =3D virt_flash_create1(vms, "virt.flash0", "pflash0");
+    vms->flash[1] =3D virt_flash_create1(vms, "virt.flash1", "pflash1");
+}
+
+static void virt_flash_map1(PFlashCFI01 *flash,
+                            hwaddr base, hwaddr size,
+                            MemoryRegion *sysmem)
+{
+    DeviceState *dev =3D DEVICE(flash);
+
+    assert(size % VIRT_FLASH_SECTOR_SIZE =3D=3D 0);
+    assert(size / VIRT_FLASH_SECTOR_SIZE <=3D UINT32_MAX);
+    qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZ=
E);
     qdev_init_nofail(dev);
=20
-    memory_region_add_subregion(sysmem, flashbase,
-                                sysbus_mmio_get_region(SYS_BUS_DEVICE(de=
v), 0));
-
-    if (file) {
-        char *fn;
-        int image_size;
-
-        if (drive_get(IF_PFLASH, 0, 0)) {
-            error_report("The contents of the first flash device may be =
"
-                         "specified with -bios or with -drive if=3Dpflas=
h... "
-                         "but you cannot use both options at once");
-            exit(1);
-        }
-        fn =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, file);
-        if (!fn) {
-            error_report("Could not find ROM image '%s'", file);
-            exit(1);
-        }
-        image_size =3D load_image_mr(fn, sysbus_mmio_get_region(sbd, 0))=
;
-        g_free(fn);
-        if (image_size < 0) {
-            error_report("Could not load ROM image '%s'", file);
-            exit(1);
-        }
-    }
+    memory_region_add_subregion(sysmem, base,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(de=
v),
+                                                       0));
 }
=20
-static void create_flash(const VirtMachineState *vms,
-                         MemoryRegion *sysmem,
-                         MemoryRegion *secure_sysmem)
+static void virt_flash_map(VirtMachineState *vms,
+                           MemoryRegion *sysmem,
+                           MemoryRegion *secure_sysmem)
 {
-    /* Create two flash devices to fill the VIRT_FLASH space in the memm=
ap.
-     * Any file passed via -bios goes in the first of these.
+    /*
+     * Map two flash devices to fill the VIRT_FLASH space in the memmap.
      * sysmem is the system memory space. secure_sysmem is the secure vi=
ew
      * of the system, and the first flash device should be made visible =
only
      * there. The second flash device is visible to both secure and nons=
ecure.
@@ -941,13 +936,21 @@ static void create_flash(const VirtMachineState *vm=
s,
      */
     hwaddr flashsize =3D vms->memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase =3D vms->memmap[VIRT_FLASH].base;
+
+    virt_flash_map1(vms->flash[0], flashbase, flashsize,
+                    secure_sysmem);
+    virt_flash_map1(vms->flash[1], flashbase + flashsize, flashsize,
+                    sysmem);
+}
+
+static void virt_flash_fdt(VirtMachineState *vms,
+                           MemoryRegion *sysmem,
+                           MemoryRegion *secure_sysmem)
+{
+    hwaddr flashsize =3D vms->memmap[VIRT_FLASH].size / 2;
+    hwaddr flashbase =3D vms->memmap[VIRT_FLASH].base;
     char *nodename;
=20
-    create_one_flash("virt.flash0", flashbase, flashsize,
-                     bios_name, secure_sysmem);
-    create_one_flash("virt.flash1", flashbase + flashsize, flashsize,
-                     NULL, sysmem);
-
     if (sysmem =3D=3D secure_sysmem) {
         /* Report both flash devices as a single node in the DT */
         nodename =3D g_strdup_printf("/flash@%" PRIx64, flashbase);
@@ -959,7 +962,8 @@ static void create_flash(const VirtMachineState *vms,
         qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
         g_free(nodename);
     } else {
-        /* Report the devices as separate nodes so we can mark one as
+        /*
+         * Report the devices as separate nodes so we can mark one as
          * only visible to the secure world.
          */
         nodename =3D g_strdup_printf("/secflash@%" PRIx64, flashbase);
@@ -982,6 +986,54 @@ static void create_flash(const VirtMachineState *vms=
,
     }
 }
=20
+static bool virt_firmware_init(VirtMachineState *vms,
+                               MemoryRegion *sysmem,
+                               MemoryRegion *secure_sysmem)
+{
+    int i;
+    BlockBackend *pflash_blk0;
+
+    /* Map legacy -drive if=3Dpflash to machine properties */
+    for (i =3D 0; i < ARRAY_SIZE(vms->flash); i++) {
+        pflash_cfi01_legacy_drive(vms->flash[i],
+                                  drive_get(IF_PFLASH, 0, i));
+    }
+
+    virt_flash_map(vms, sysmem, secure_sysmem);
+
+    pflash_blk0 =3D pflash_cfi01_get_blk(vms->flash[0]);
+
+    if (bios_name) {
+        char *fname;
+        MemoryRegion *mr;
+        int image_size;
+
+        if (pflash_blk0) {
+            error_report("The contents of the first flash device may be =
"
+                         "specified with -bios or with -drive if=3Dpflas=
h... "
+                         "but you cannot use both options at once");
+            exit(1);
+        }
+
+        /* Fall back to -bios */
+
+        fname =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+        if (!fname) {
+            error_report("Could not find ROM image '%s'", bios_name);
+            exit(1);
+        }
+        mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(vms->flash[0]), 0);
+        image_size =3D load_image_mr(fname, mr);
+        g_free(fname);
+        if (image_size < 0) {
+            error_report("Could not load ROM image '%s'", bios_name);
+            exit(1);
+        }
+    }
+
+    return pflash_blk0 || bios_name;
+}
+
 static FWCfgState *create_fw_cfg(const VirtMachineState *vms, AddressSpa=
ce *as)
 {
     hwaddr base =3D vms->memmap[VIRT_FW_CFG].base;
@@ -1421,7 +1473,7 @@ static void machvirt_init(MachineState *machine)
     MemoryRegion *secure_sysmem =3D NULL;
     int n, virt_max_cpus;
     MemoryRegion *ram =3D g_new(MemoryRegion, 1);
-    bool firmware_loaded =3D bios_name || drive_get(IF_PFLASH, 0, 0);
+    bool firmware_loaded;
     bool aarch64 =3D true;
=20
     /*
@@ -1460,6 +1512,27 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
=20
+    if (vms->secure) {
+        if (kvm_enabled()) {
+            error_report("mach-virt: KVM does not support Security exten=
sions");
+            exit(1);
+        }
+
+        /*
+         * The Secure view of the world is the same as the NonSecure,
+         * but with a few extra devices. Create it as a container region
+         * containing the system memory at low priority; any secure-only
+         * devices go in at higher priority and take precedence.
+         */
+        secure_sysmem =3D g_new(MemoryRegion, 1);
+        memory_region_init(secure_sysmem, OBJECT(machine), "secure-memor=
y",
+                           UINT64_MAX);
+        memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, -1=
);
+    }
+
+    firmware_loaded =3D virt_firmware_init(vms, sysmem,
+                                         secure_sysmem ?: sysmem);
+
     /* If we have an EL3 boot ROM then the assumption is that it will
      * implement PSCI itself, so disable QEMU's internal implementation
      * so it doesn't get in the way. Instead of starting secondary
@@ -1505,23 +1578,6 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
=20
-    if (vms->secure) {
-        if (kvm_enabled()) {
-            error_report("mach-virt: KVM does not support Security exten=
sions");
-            exit(1);
-        }
-
-        /* The Secure view of the world is the same as the NonSecure,
-         * but with a few extra devices. Create it as a container region
-         * containing the system memory at low priority; any secure-only
-         * devices go in at higher priority and take precedence.
-         */
-        secure_sysmem =3D g_new(MemoryRegion, 1);
-        memory_region_init(secure_sysmem, OBJECT(machine), "secure-memor=
y",
-                           UINT64_MAX);
-        memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, -1=
);
-    }
-
     create_fdt(vms);
=20
     possible_cpus =3D mc->possible_cpu_arch_ids(machine);
@@ -1610,7 +1666,7 @@ static void machvirt_init(MachineState *machine)
                                     &machine->device_memory->mr);
     }
=20
-    create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
+    virt_flash_fdt(vms, sysmem, secure_sysmem);
=20
     create_gic(vms, pic);
=20
@@ -1956,6 +2012,8 @@ static void virt_instance_init(Object *obj)
                                     NULL);
=20
     vms->irqmap =3D a15irqmap;
+
+    virt_flash_create(vms);
 }
=20
 static const TypeInfo virt_machine_info =3D {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 507517c603..424070924e 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -35,6 +35,7 @@
 #include "qemu/notify.h"
 #include "hw/boards.h"
 #include "hw/arm/arm.h"
+#include "hw/block/flash.h"
 #include "sysemu/kvm.h"
 #include "hw/intc/arm_gicv3_common.h"
=20
@@ -113,6 +114,7 @@ typedef struct {
     Notifier machine_done;
     DeviceState *platform_bus_dev;
     FWCfgState *fw_cfg;
+    PFlashCFI01 *flash[2];
     bool secure;
     bool highmem;
     bool highmem_ecam;
--=20
2.17.2

