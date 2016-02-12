Received: by 10.25.159.19 with SMTP id i19csp863720lfe;
        Fri, 12 Feb 2016 06:48:11 -0800 (PST)
X-Received: by 10.55.43.200 with SMTP id r69mr2292743qkr.84.1455288491393;
        Fri, 12 Feb 2016 06:48:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q67si16058693qgd.110.2016.02.12.06.48.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:48:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33273 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUF10-0007c0-VI
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 09:48:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUEzA-00044X-Q4
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 09:46:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUEz9-0004si-Hz
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 09:46:16 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57320)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUEz6-0004jw-EO; Fri, 12 Feb 2016 09:46:12 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUEyv-0007qY-Lk; Fri, 12 Feb 2016 14:46:01 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 12 Feb 2016 14:46:01 +0000
Message-Id: <1455288361-30117-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-arm] [PATCH 4/4] hw/arm/virt: Make first flash device
	Secure-only if booting secure
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0i2XI6dK76EX

If the virt board is started with the 'secure' property set to
request a Secure setup, then make the first flash device be
visible only to the Secure world.

This is a breaking change, but I don't expect it to be noticed
by anybody, because running TZ-aware guests isn't common and
those guests are generally going to be booting from the flash
and implicitly expecting their Non-secure guests to not touch it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 14 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 391cf3f..4499e2c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -679,7 +679,8 @@ static void create_virtio_devices(const VirtBoardInfo *vbi, qemu_irq *pic)
 }
 
 static void create_one_flash(const char *name, hwaddr flashbase,
-                             hwaddr flashsize, const char *file)
+                             hwaddr flashsize, const char *file,
+                             MemoryRegion *sysmem)
 {
     /* Create and map a single flash device. We use the same
      * parameters as the flash devices on the Versatile Express board.
@@ -706,7 +707,8 @@ static void create_one_flash(const char *name, hwaddr flashbase,
     qdev_prop_set_string(dev, "name", name);
     qdev_init_nofail(dev);
 
-    sysbus_mmio_map(sbd, 0, flashbase);
+    memory_region_add_subregion(sysmem, flashbase,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
 
     if (file) {
         char *fn;
@@ -732,26 +734,59 @@ static void create_one_flash(const char *name, hwaddr flashbase,
     }
 }
 
-static void create_flash(const VirtBoardInfo *vbi)
+static void create_flash(const VirtBoardInfo *vbi,
+                         MemoryRegion *sysmem,
+                         MemoryRegion *secure_sysmem)
 {
     /* Create two flash devices to fill the VIRT_FLASH space in the memmap.
      * Any file passed via -bios goes in the first of these.
+     * sysmem is the system memory space. secure_sysmem is the secure view
+     * of the system, and the first flash device should be made visible only
+     * there. The second flash device is visible to both secure and nonsecure.
+     * If sysmem == secure_sysmem this means there is no separate Secure
+     * address space and both flash devices are generally visible.
      */
     hwaddr flashsize = vbi->memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = vbi->memmap[VIRT_FLASH].base;
     char *nodename;
 
-    create_one_flash("virt.flash0", flashbase, flashsize, bios_name);
-    create_one_flash("virt.flash1", flashbase + flashsize, flashsize, NULL);
+    create_one_flash("virt.flash0", flashbase, flashsize,
+                     bios_name, secure_sysmem);
+    create_one_flash("virt.flash1", flashbase + flashsize, flashsize,
+                     NULL, sysmem);
 
-    nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
-    qemu_fdt_add_subnode(vbi->fdt, nodename);
-    qemu_fdt_setprop_string(vbi->fdt, nodename, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(vbi->fdt, nodename, "reg",
-                                 2, flashbase, 2, flashsize,
-                                 2, flashbase + flashsize, 2, flashsize);
-    qemu_fdt_setprop_cell(vbi->fdt, nodename, "bank-width", 4);
-    g_free(nodename);
+    if (sysmem == secure_sysmem) {
+        /* Report both flash devices as a single node in the DT */
+        nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
+        qemu_fdt_add_subnode(vbi->fdt, nodename);
+        qemu_fdt_setprop_string(vbi->fdt, nodename, "compatible", "cfi-flash");
+        qemu_fdt_setprop_sized_cells(vbi->fdt, nodename, "reg",
+                                     2, flashbase, 2, flashsize,
+                                     2, flashbase + flashsize, 2, flashsize);
+        qemu_fdt_setprop_cell(vbi->fdt, nodename, "bank-width", 4);
+        g_free(nodename);
+    } else {
+        /* Report the devices as separate nodes so we can mark one as
+         * only visible to the secure world.
+         */
+        nodename = g_strdup_printf("/secflash@%" PRIx64, flashbase);
+        qemu_fdt_add_subnode(vbi->fdt, nodename);
+        qemu_fdt_setprop_string(vbi->fdt, nodename, "compatible", "cfi-flash");
+        qemu_fdt_setprop_sized_cells(vbi->fdt, nodename, "reg",
+                                     2, flashbase, 2, flashsize);
+        qemu_fdt_setprop_cell(vbi->fdt, nodename, "bank-width", 4);
+        qemu_fdt_setprop_string(vbi->fdt, nodename, "status", "disabled");
+        qemu_fdt_setprop_string(vbi->fdt, nodename, "secure-status", "okay");
+        g_free(nodename);
+
+        nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
+        qemu_fdt_add_subnode(vbi->fdt, nodename);
+        qemu_fdt_setprop_string(vbi->fdt, nodename, "compatible", "cfi-flash");
+        qemu_fdt_setprop_sized_cells(vbi->fdt, nodename, "reg",
+                                     2, flashbase + flashsize, 2, flashsize);
+        qemu_fdt_setprop_cell(vbi->fdt, nodename, "bank-width", 4);
+        g_free(nodename);
+    }
 }
 
 static void create_fw_cfg(const VirtBoardInfo *vbi, AddressSpace *as)
@@ -1171,7 +1206,7 @@ static void machvirt_init(MachineState *machine)
                                          machine->ram_size);
     memory_region_add_subregion(sysmem, vbi->memmap[VIRT_MEM].base, ram);
 
-    create_flash(vbi);
+    create_flash(vbi, sysmem, secure_sysmem ? secure_sysmem : sysmem);
 
     create_gic(vbi, pic, gic_version, vms->secure);
 
-- 
1.9.1

