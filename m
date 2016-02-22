Received: by 10.25.208.211 with SMTP id h202csp1156517lfg;
        Mon, 22 Feb 2016 04:41:52 -0800 (PST)
X-Received: by 10.140.19.132 with SMTP id 4mr33930402qgh.56.1456144912513;
        Mon, 22 Feb 2016 04:41:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g6si27953342qkb.57.2016.02.22.04.41.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 04:41:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXpoG-0006Bp-04
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 07:41:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aXpoC-0006BF-WE
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 07:41:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aXpo8-0004kl-UP
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 07:41:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44921)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aXpo8-0004kg-Jm; Mon, 22 Feb 2016 07:41:44 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 84CB61E24;
	Mon, 22 Feb 2016 12:41:43 +0000 (UTC)
Received: from redhat.com (vpn1-7-22.ams2.redhat.com [10.36.7.22])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u1MCfdPs007611; Mon, 22 Feb 2016 07:41:40 -0500
Date: Mon, 22 Feb 2016 14:41:38 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1456144729-17196-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Kevin O'Connor <kevin@koconnor.net>, Eduardo Habkost <ehabkost@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-arm] [PATCH RFC] fw-cfg: support writeable blobs
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
X-TUID: IXw8bqTtPX5N

Useful to send guest data back to QEMU.
The write interface is restricted to DMA.

Suggested-by: Kevin O'Connor <kevin@koconnor.net>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

 hw/lm32/lm32_hwsetup.h    |  2 +-
 include/hw/loader.h       |  4 ++--
 include/hw/nvram/fw_cfg.h |  3 ++-
 hw/arm/virt-acpi-build.c  |  2 +-
 hw/core/loader.c          | 19 ++++++++++++-------
 hw/i386/acpi-build.c      |  4 ++--
 hw/nvram/fw_cfg.c         | 36 ++++++++++++++++++++++++++++--------
 7 files changed, 48 insertions(+), 22 deletions(-)

diff --git a/hw/lm32/lm32_hwsetup.h b/hw/lm32/lm32_hwsetup.h
index 838754d..805b445 100644
--- a/hw/lm32/lm32_hwsetup.h
+++ b/hw/lm32/lm32_hwsetup.h
@@ -74,7 +74,7 @@ static inline void hwsetup_create_rom(HWSetup *hw,
         hwaddr base)
 {
     rom_add_blob("hwsetup", hw->data, TARGET_PAGE_SIZE,
-                 TARGET_PAGE_SIZE, base, NULL, NULL, NULL);
+                 TARGET_PAGE_SIZE, base, NULL, NULL, NULL, true);
 }
 
 static inline void hwsetup_add_u8(HWSetup *hw, uint8_t u)
diff --git a/include/hw/loader.h b/include/hw/loader.h
index f7b43ab..14d99e3 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -72,7 +72,7 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
                            size_t max_len, hwaddr addr,
                            const char *fw_file_name,
                            FWCfgReadCallback fw_callback,
-                           void *callback_opaque);
+                           void *callback_opaque, bool read_only);
 int rom_add_elf_program(const char *name, void *data, size_t datasize,
                         size_t romsize, hwaddr addr);
 int rom_check_and_register_reset(void);
@@ -84,7 +84,7 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict);
 #define rom_add_file_fixed(_f, _a, _i)          \
     rom_add_file(_f, NULL, _a, _i, false)
 #define rom_add_blob_fixed(_f, _b, _l, _a)      \
-    rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL)
+    rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL, true)
 
 #define PC_ROM_MIN_VGA     0xc0000
 #define PC_ROM_MIN_OPTION  0xc8000
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 664eaf6..371e75e 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -173,6 +173,7 @@ void fw_cfg_add_file(FWCfgState *s, const char *filename, void *data,
  * @callback_opaque: argument to be passed into callback function
  * @data: pointer to start of item data
  * @len: size of item data
+ * @read_only: is file read only
  *
  * Add a new NAMED fw_cfg item as a raw "blob" of the given size. The data
  * referenced by the starting pointer is only linked, NOT copied, into the
@@ -188,7 +189,7 @@ void fw_cfg_add_file(FWCfgState *s, const char *filename, void *data,
  */
 void fw_cfg_add_file_callback(FWCfgState *s, const char *filename,
                               FWCfgReadCallback callback, void *callback_opaque,
-                              void *data, size_t len);
+                              void *data, size_t len, bool read_only);
 
 /**
  * fw_cfg_modify_file:
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b8b3ece..c076bbf 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -679,7 +679,7 @@ static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
                                        uint64_t max_size)
 {
     return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
-                        name, virt_acpi_build_update, build_state);
+                        name, virt_acpi_build_update, build_state, true);
 }
 
 static const VMStateDescription vmstate_virt_acpi_build = {
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 3a57415..ee05c7a 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -731,7 +731,7 @@ static void fw_cfg_resized(const char *id, uint64_t length, void *host)
     }
 }
 
-static void *rom_set_mr(Rom *rom, Object *owner, const char *name)
+static void *rom_set_mr(Rom *rom, Object *owner, const char *name, bool ro)
 {
     void *data;
 
@@ -740,7 +740,7 @@ static void *rom_set_mr(Rom *rom, Object *owner, const char *name)
                                       rom->datasize, rom->romsize,
                                       fw_cfg_resized,
                                       &error_fatal);
-    memory_region_set_readonly(rom->mr, true);
+    memory_region_set_readonly(rom->mr, ro);
     vmstate_register_ram_global(rom->mr);
 
     data = memory_region_get_ram_ptr(rom->mr);
@@ -811,7 +811,7 @@ int rom_add_file(const char *file, const char *fw_dir,
         snprintf(devpath, sizeof(devpath), "/rom@%s", fw_file_name);
 
         if ((!option_rom || mc->option_rom_has_mr) && mc->rom_file_has_mr) {
-            data = rom_set_mr(rom, OBJECT(fw_cfg), devpath);
+            data = rom_set_mr(rom, OBJECT(fw_cfg), devpath, true);
         } else {
             data = rom->data;
         }
@@ -836,7 +836,8 @@ err:
 
 MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
                    size_t max_len, hwaddr addr, const char *fw_file_name,
-                   FWCfgReadCallback fw_callback, void *callback_opaque)
+                   FWCfgReadCallback fw_callback, void *callback_opaque,
+                   bool read_only)
 {
     MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
     Rom *rom;
@@ -854,10 +855,14 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
         char devpath[100];
         void *data;
 
-        snprintf(devpath, sizeof(devpath), "/rom@%s", fw_file_name);
+        if (read_only) {
+            snprintf(devpath, sizeof(devpath), "/rom@%s", fw_file_name);
+        } else {
+            snprintf(devpath, sizeof(devpath), "/ram@%s", fw_file_name);
+        }
 
         if (mc->rom_file_has_mr) {
-            data = rom_set_mr(rom, OBJECT(fw_cfg), devpath);
+            data = rom_set_mr(rom, OBJECT(fw_cfg), devpath, read_only);
             mr = rom->mr;
         } else {
             data = rom->data;
@@ -865,7 +870,7 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
 
         fw_cfg_add_file_callback(fw_cfg, fw_file_name,
                                  fw_callback, callback_opaque,
-                                 data, rom->datasize);
+                                 data, rom->datasize, read_only);
     }
     return mr;
 }
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 52c9470..b654b0d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2791,7 +2791,7 @@ static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
                                        uint64_t max_size)
 {
     return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
-                        name, acpi_build_update, build_state);
+                        name, acpi_build_update, build_state, true);
 }
 
 static const VMStateDescription vmstate_acpi_build = {
@@ -2856,7 +2856,7 @@ void acpi_setup(void)
         build_state->rsdp = g_memdup(tables.rsdp->data, rsdp_size);
         fw_cfg_add_file_callback(pcms->fw_cfg, ACPI_BUILD_RSDP_FILE,
                                  acpi_build_update, build_state,
-                                 build_state->rsdp, rsdp_size);
+                                 build_state->rsdp, rsdp_size, true);
         build_state->rsdp_mr = NULL;
     } else {
         build_state->rsdp = NULL;
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 79c5742..b5d9577 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -53,11 +53,13 @@
 #define FW_CFG_DMA_CTL_READ    0x02
 #define FW_CFG_DMA_CTL_SKIP    0x04
 #define FW_CFG_DMA_CTL_SELECT  0x08
+#define FW_CFG_DMA_CTL_WRITE   0x10
 
 #define FW_CFG_DMA_SIGNATURE 0x51454d5520434647ULL /* "QEMU CFG" */
 
 typedef struct FWCfgEntry {
     uint32_t len;
+    bool allow_write;
     uint8_t *data;
     void *callback_opaque;
     FWCfgReadCallback read_callback;
@@ -322,7 +324,7 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
     FWCfgDmaAccess dma;
     int arch;
     FWCfgEntry *e;
-    int read;
+    int read = 0, write = 0;
     dma_addr_t dma_addr;
 
     /* Reset the address before the next access */
@@ -349,8 +351,13 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
 
     if (dma.control & FW_CFG_DMA_CTL_READ) {
         read = 1;
+        write = 0;
+    } else if (dma.control & FW_CFG_DMA_CTL_WRITE) {
+        read = 0;
+        write = 1;
     } else if (dma.control & FW_CFG_DMA_CTL_SKIP) {
         read = 0;
+        write = 0;
     } else {
         dma.length = 0;
     }
@@ -370,7 +377,9 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
                     dma.control |= FW_CFG_DMA_CTL_ERROR;
                 }
             }
-
+            if (write) {
+                dma.control |= FW_CFG_DMA_CTL_ERROR;
+            }
         } else {
             if (dma.length <= (e->len - s->cur_offset)) {
                 len = dma.length;
@@ -387,6 +396,13 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
                     dma.control |= FW_CFG_DMA_CTL_ERROR;
                 }
             }
+            if (write) {
+                if (!e->allow_write ||
+                    dma_memory_read(s->dma_as, dma.address,
+                                    &e->data[s->cur_offset], len)) {
+                    dma.control |= FW_CFG_DMA_CTL_ERROR;
+                }
+            }
 
             s->cur_offset += len;
         }
@@ -582,7 +598,8 @@ static const VMStateDescription vmstate_fw_cfg = {
 static void fw_cfg_add_bytes_read_callback(FWCfgState *s, uint16_t key,
                                            FWCfgReadCallback callback,
                                            void *callback_opaque,
-                                           void *data, size_t len)
+                                           void *data, size_t len,
+                                           bool read_only)
 {
     int arch = !!(key & FW_CFG_ARCH_LOCAL);
 
@@ -595,6 +612,7 @@ static void fw_cfg_add_bytes_read_callback(FWCfgState *s, uint16_t key,
     s->entries[arch][key].len = (uint32_t)len;
     s->entries[arch][key].read_callback = callback;
     s->entries[arch][key].callback_opaque = callback_opaque;
+    s->entries[arch][key].allow_write = !read_only;
 }
 
 static void *fw_cfg_modify_bytes_read(FWCfgState *s, uint16_t key,
@@ -612,13 +630,14 @@ static void *fw_cfg_modify_bytes_read(FWCfgState *s, uint16_t key,
     s->entries[arch][key].data = data;
     s->entries[arch][key].len = len;
     s->entries[arch][key].callback_opaque = NULL;
+    s->entries[arch][key].allow_write = false;
 
     return ptr;
 }
 
 void fw_cfg_add_bytes(FWCfgState *s, uint16_t key, void *data, size_t len)
 {
-    fw_cfg_add_bytes_read_callback(s, key, NULL, NULL, data, len);
+    fw_cfg_add_bytes_read_callback(s, key, NULL, NULL, data, len, true);
 }
 
 void fw_cfg_add_string(FWCfgState *s, uint16_t key, const char *value)
@@ -667,7 +686,7 @@ void fw_cfg_add_i64(FWCfgState *s, uint16_t key, uint64_t value)
 
 void fw_cfg_add_file_callback(FWCfgState *s,  const char *filename,
                               FWCfgReadCallback callback, void *callback_opaque,
-                              void *data, size_t len)
+                              void *data, size_t len, bool read_only)
 {
     int i, index;
     size_t dsize;
@@ -692,7 +711,8 @@ void fw_cfg_add_file_callback(FWCfgState *s,  const char *filename,
     }
 
     fw_cfg_add_bytes_read_callback(s, FW_CFG_FILE_FIRST + index,
-                                   callback, callback_opaque, data, len);
+                                   callback, callback_opaque, data, len,
+                                   read_only);
 
     s->files->f[index].size   = cpu_to_be32(len);
     s->files->f[index].select = cpu_to_be16(FW_CFG_FILE_FIRST + index);
@@ -704,7 +724,7 @@ void fw_cfg_add_file_callback(FWCfgState *s,  const char *filename,
 void fw_cfg_add_file(FWCfgState *s,  const char *filename,
                      void *data, size_t len)
 {
-    fw_cfg_add_file_callback(s, filename, NULL, NULL, data, len);
+    fw_cfg_add_file_callback(s, filename, NULL, NULL, data, len, true);
 }
 
 void *fw_cfg_modify_file(FWCfgState *s, const char *filename,
@@ -727,7 +747,7 @@ void *fw_cfg_modify_file(FWCfgState *s, const char *filename,
         }
     }
     /* add new one */
-    fw_cfg_add_file_callback(s, filename, NULL, NULL, data, len);
+    fw_cfg_add_file_callback(s, filename, NULL, NULL, data, len, true);
     return NULL;
 }
 
-- 
MST
