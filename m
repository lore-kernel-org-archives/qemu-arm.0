Received: by 10.25.159.19 with SMTP id i19csp862763lfe;
        Fri, 12 Feb 2016 06:46:19 -0800 (PST)
X-Received: by 10.140.104.50 with SMTP id z47mr2340647qge.68.1455288379308;
        Fri, 12 Feb 2016 06:46:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t65si8957278qhc.2.2016.02.12.06.46.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:46:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33250 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUEzC-00046s-R0
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 09:46:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUEz9-00041M-IZ
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 09:46:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUEz8-0004r0-AV
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 09:46:15 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57320)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUEz5-0004jw-1b; Fri, 12 Feb 2016 09:46:11 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUEyv-0007qQ-Hn; Fri, 12 Feb 2016 14:46:01 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 12 Feb 2016 14:45:59 +0000
Message-Id: <1455288361-30117-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-arm] [PATCH 2/4] loader: Add load_image_mr() to load ROM
	image to a MemoryRegion
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
X-TUID: 4LK4WLVCBVzL

Add a new function load_image_mr(), which behaves like
load_image_targphys() except that it loads the ROM image to
a specified MemoryRegion rather than to a specified physical
address. This is useful when a ROM blob needs to be loaded
to a particular flash or ROM device but the address of that
device in the machine's address space is not known. (For
instance, ROMs in devices, or ROMs which might exist in
a different address space to the system address space.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/core/loader.c    | 35 +++++++++++++++++++++++++++++++----
 include/hw/loader.h | 18 ++++++++++++++++--
 2 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 3a57415..260b3d6 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -147,6 +147,28 @@ int load_image_targphys(const char *filename,
     return size;
 }
 
+int load_image_mr(const char *filename, MemoryRegion *mr)
+{
+    int size;
+
+    if (!memory_access_is_direct(mr, false)) {
+        /* Can only load an image into RAM or ROM */
+        return -1;
+    }
+
+    size = get_image_size(filename);
+
+    if (size > memory_region_size(mr)) {
+        return -1;
+    }
+    if (size > 0) {
+        if (rom_add_file_mr(filename, mr, -1) < 0) {
+            return -1;
+        }
+    }
+    return size;
+}
+
 void pstrcpy_targphys(const char *name, hwaddr dest, int buf_size,
                       const char *source)
 {
@@ -751,7 +773,7 @@ static void *rom_set_mr(Rom *rom, Object *owner, const char *name)
 
 int rom_add_file(const char *file, const char *fw_dir,
                  hwaddr addr, int32_t bootindex,
-                 bool option_rom)
+                 bool option_rom, MemoryRegion *mr)
 {
     MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
     Rom *rom;
@@ -818,7 +840,12 @@ int rom_add_file(const char *file, const char *fw_dir,
 
         fw_cfg_add_file(fw_cfg, fw_file_name, data, rom->romsize);
     } else {
-        snprintf(devpath, sizeof(devpath), "/rom@" TARGET_FMT_plx, addr);
+        if (mr) {
+            rom->mr = mr;
+            snprintf(devpath, sizeof(devpath), "/rom@%s", file);
+        } else {
+            snprintf(devpath, sizeof(devpath), "/rom@" TARGET_FMT_plx, addr);
+        }
     }
 
     add_boot_device_path(bootindex, NULL, devpath);
@@ -892,12 +919,12 @@ int rom_add_elf_program(const char *name, void *data, size_t datasize,
 
 int rom_add_vga(const char *file)
 {
-    return rom_add_file(file, "vgaroms", 0, -1, true);
+    return rom_add_file(file, "vgaroms", 0, -1, true, NULL);
 }
 
 int rom_add_option(const char *file, int32_t bootindex)
 {
-    return rom_add_file(file, "genroms", 0, bootindex, true);
+    return rom_add_file(file, "genroms", 0, bootindex, true, NULL);
 }
 
 static void rom_reset(void *unused)
diff --git a/include/hw/loader.h b/include/hw/loader.h
index f7b43ab..09c3764 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -16,6 +16,18 @@ int load_image(const char *filename, uint8_t *addr); /* deprecated */
 ssize_t load_image_size(const char *filename, void *addr, size_t size);
 int load_image_targphys(const char *filename, hwaddr,
                         uint64_t max_sz);
+/**
+ * load_image_mr: load an image into a memory region
+ * @filename: Path to the image file
+ * @mr: Memory Region to load into
+ *
+ * Load the specified file into the memory region.
+ * The file loaded is registered as a ROM, so its contents will be
+ * reinstated whenever the system is reset.
+ * If the file is larger than the memory region's size the call will fail.
+ * Returns -1 on failure, or the size of the file.
+ */
+int load_image_mr(const char *filename, MemoryRegion *mr);
 
 /* This is the limit on the maximum uncompressed image size that
  * load_image_gzipped_buffer() and load_image_gzipped() will read. It prevents
@@ -67,7 +79,7 @@ extern bool rom_file_has_mr;
 
 int rom_add_file(const char *file, const char *fw_dir,
                  hwaddr addr, int32_t bootindex,
-                 bool option_rom);
+                 bool option_rom, MemoryRegion *mr);
 MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
                            size_t max_len, hwaddr addr,
                            const char *fw_file_name,
@@ -82,9 +94,11 @@ void *rom_ptr(hwaddr addr);
 void hmp_info_roms(Monitor *mon, const QDict *qdict);
 
 #define rom_add_file_fixed(_f, _a, _i)          \
-    rom_add_file(_f, NULL, _a, _i, false)
+    rom_add_file(_f, NULL, _a, _i, false, NULL)
 #define rom_add_blob_fixed(_f, _b, _l, _a)      \
     rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL)
+#define rom_add_file_mr(_f, _mr, _i)            \
+    rom_add_file(_f, NULL, 0, _i, false, mr)
 
 #define PC_ROM_MIN_VGA     0xc0000
 #define PC_ROM_MIN_OPTION  0xc8000
-- 
1.9.1

