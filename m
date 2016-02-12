Received: by 10.25.159.19 with SMTP id i19csp863190lfe;
        Fri, 12 Feb 2016 06:47:09 -0800 (PST)
X-Received: by 10.55.78.207 with SMTP id c198mr2320762qkb.34.1455288429034;
        Fri, 12 Feb 2016 06:47:09 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c204si16041961qha.64.2016.02.12.06.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:47:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUF00-0005HC-FJ
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 09:47:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUEz6-0003zy-U9
	for qemu-devel@nongnu.org; Fri, 12 Feb 2016 09:46:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUEz6-0004p1-0x
	for qemu-devel@nongnu.org; Fri, 12 Feb 2016 09:46:12 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57320)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUEz5-0004jw-Pi; Fri, 12 Feb 2016 09:46:11 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUEyv-0007qU-K0; Fri, 12 Feb 2016 14:46:01 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 12 Feb 2016 14:46:00 +0000
Message-Id: <1455288361-30117-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-devel] [PATCH 3/4] hw/arm/virt: Load bios image to
	MemoryRegion, not physaddr
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OVeZlK/stigQ

If we're loading a BIOS image into the first flash device,
load it into the flash's memory region specifically, not
into the physical address where the flash resides. This will
make a difference when the flash might be in the Secure
address space rather than the Nonsecure one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5bdfe0f..391cf3f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -679,13 +679,14 @@ static void create_virtio_devices(const VirtBoardInfo *vbi, qemu_irq *pic)
 }
 
 static void create_one_flash(const char *name, hwaddr flashbase,
-                             hwaddr flashsize)
+                             hwaddr flashsize, const char *file)
 {
     /* Create and map a single flash device. We use the same
      * parameters as the flash devices on the Versatile Express board.
      */
     DriveInfo *dinfo = drive_get_next(IF_PFLASH);
     DeviceState *dev = qdev_create(NULL, "cfi.pflash01");
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     const uint64_t sectorlength = 256 * 1024;
 
     if (dinfo) {
@@ -705,19 +706,9 @@ static void create_one_flash(const char *name, hwaddr flashbase,
     qdev_prop_set_string(dev, "name", name);
     qdev_init_nofail(dev);
 
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, flashbase);
-}
-
-static void create_flash(const VirtBoardInfo *vbi)
-{
-    /* Create two flash devices to fill the VIRT_FLASH space in the memmap.
-     * Any file passed via -bios goes in the first of these.
-     */
-    hwaddr flashsize = vbi->memmap[VIRT_FLASH].size / 2;
-    hwaddr flashbase = vbi->memmap[VIRT_FLASH].base;
-    char *nodename;
+    sysbus_mmio_map(sbd, 0, flashbase);
 
-    if (bios_name) {
+    if (file) {
         char *fn;
         int image_size;
 
@@ -727,21 +718,31 @@ static void create_flash(const VirtBoardInfo *vbi)
                          "but you cannot use both options at once");
             exit(1);
         }
-        fn = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+        fn = qemu_find_file(QEMU_FILE_TYPE_BIOS, file);
         if (!fn) {
-            error_report("Could not find ROM image '%s'", bios_name);
+            error_report("Could not find ROM image '%s'", file);
             exit(1);
         }
-        image_size = load_image_targphys(fn, flashbase, flashsize);
+        image_size = load_image_mr(fn, sysbus_mmio_get_region(sbd, 0));
         g_free(fn);
         if (image_size < 0) {
-            error_report("Could not load ROM image '%s'", bios_name);
+            error_report("Could not load ROM image '%s'", file);
             exit(1);
         }
     }
+}
+
+static void create_flash(const VirtBoardInfo *vbi)
+{
+    /* Create two flash devices to fill the VIRT_FLASH space in the memmap.
+     * Any file passed via -bios goes in the first of these.
+     */
+    hwaddr flashsize = vbi->memmap[VIRT_FLASH].size / 2;
+    hwaddr flashbase = vbi->memmap[VIRT_FLASH].base;
+    char *nodename;
 
-    create_one_flash("virt.flash0", flashbase, flashsize);
-    create_one_flash("virt.flash1", flashbase + flashsize, flashsize);
+    create_one_flash("virt.flash0", flashbase, flashsize, bios_name);
+    create_one_flash("virt.flash1", flashbase + flashsize, flashsize, NULL);
 
     nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
     qemu_fdt_add_subnode(vbi->fdt, nodename);
-- 
1.9.1

