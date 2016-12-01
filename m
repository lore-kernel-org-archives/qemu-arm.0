Received: by 10.25.159.131 with SMTP id i125csp629234lfe;
        Wed, 30 Nov 2016 20:02:59 -0800 (PST)
X-Received: by 10.200.47.180 with SMTP id l49mr33914097qta.212.1480564979207;
        Wed, 30 Nov 2016 20:02:59 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t3si39428784qkc.99.2016.11.30.20.02.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Nov 2016 20:02:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47964 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cCIaI-0001sn-Kh
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 23:02:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <SRS0=Bfgi=XQ=redhat.com=mst@kernel.org>)
	id 1cCIWN-0007BP-A3
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 22:58:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <SRS0=Bfgi=XQ=redhat.com=mst@kernel.org>)
	id 1cCIWL-0004PE-Nd
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 22:58:55 -0500
Received: from mail.kernel.org ([198.145.29.136]:58500)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <SRS0=Bfgi=XQ=redhat.com=mst@kernel.org>)
	id 1cCIWL-0004P5-EW; Wed, 30 Nov 2016 22:58:53 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 4664F20279;
	Thu,  1 Dec 2016 03:58:51 +0000 (UTC)
Received: from redhat.com (pool-173-76-102-160.bstnma.fios.verizon.net
	[173.76.102.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E47B720263;
	Thu,  1 Dec 2016 03:58:48 +0000 (UTC)
Date: Thu, 1 Dec 2016 05:58:47 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1480564455-23933-4-git-send-email-mst@redhat.com>
References: <1480564455-23933-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480564455-23933-1-git-send-email-mst@redhat.com>
X-Mailer: git-send-email 2.8.0.287.g0deeb61
X-Mutt-Fcc: =sent
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PULL 3/5] loader: fix handling of custom address spaces
 when adding ROM blobs
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gfBRs8oW4MRS

From: Laszlo Ersek <lersek@redhat.com>

* Commit 3e76099aacb4 ("loader: Allow a custom AddressSpace when loading
  ROMs") introduced the "Rom.as" field:

  (1) It modified the utility callers of rom_insert() to take "as" as a
      new parameter from *their* callers, and set "rom->as" from that
      parameter. The functions covered were rom_add_file() and
      rom_add_elf_program().

  (2) It also modified rom_insert() itself, to auto-assign
      "&address_space_memory", in case the external caller passed -- and
      the utility caller forwarded -- as=NULL.

  Except, commit 3e76099aacb4 forgot to update the third utility caller of
  rom_insert(), under point (1), namely rom_add_blob().

* Later, commit 5e774eb3bd264 ("loader: Add AddressSpace loading support
  to uImages") added the load_uimage_as() function, and the
  rom_add_blob_fixed_as() function-like macro, with the necessary changes
  elsewhere to propagate the new "as" parameter to rom_add_blob():

    load_uimage_as()
      load_uboot_image()
        rom_add_blob_fixed_as()
          rom_add_blob()

  At this point, the signature (and workings) of rom_add_blob() had been
  broken already, and the rom_add_blob_fixed_as() macro passed its "_as"
  parameter to rom_add_blob() as "callback_opaque". Given that the
  "fw_callback" parameter itself was set to NULL (correctly), this did no
  additional damage (the opaque arg would never be used), but ultimately
  it broke the new functionality of load_uimage_as().

* The load_uimage_as() function would be put to use in one of the later
  patches, commit e481a1f63c93 ("generic-loader: Add a generic loader").

* We can fix this only in a unified patch now. Append "AddressSpace *as"
  to the signature of rom_add_blob(), and handle the new parameter. Pass
  NULL from all current callers, except from rom_add_blob_fixed_as(),
  where "_as" has to be bumped to the proper position.

* Note that rom_add_file() rejects the case when both "mr" and "as" are
  passed in as non-NULL. The action that this is apparently supposed to
  prevent is the

    rom->mr = mr;

  assignment (that's the only place where the "mr" parameter is used in
  rom_add_file()). In rom_add_blob() though, we have no "mr" parameter,
  and the actions done on the fw_cfg branch:

    if (fw_file_name && fw_cfg) {
        if (mc->rom_file_has_mr) {
            data = rom_set_mr(rom, OBJECT(fw_cfg), devpath);
            mr = rom->mr;
        } else {
            data = rom->data;
        }

  reflect those that are performed by rom_add_file() too (with mr==NULL):

    if (rom->fw_file && fw_cfg) {
        if ((!option_rom || mc->option_rom_has_mr) &&
            mc->rom_file_has_mr) {
            data = rom_set_mr(rom, OBJECT(fw_cfg), devpath);
        } else {
            data = rom->data;
        }

  Hence we need no additional restrictions in rom_add_blob().

* Stable is not affected as both problematic commits appeared first in
  v2.8.0-rc0.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Shannon Zhao <zhaoshenglong@huawei.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Fixes: 3e76099aacb4dae0d37ebf95305369e03d1491e6
Fixes: 5e774eb3bd264c76484906f4bd0fb38e00b8090e
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/lm32/lm32_hwsetup.h   | 2 +-
 include/hw/loader.h      | 6 +++---
 hw/arm/virt-acpi-build.c | 2 +-
 hw/core/loader.c         | 4 +++-
 hw/i386/acpi-build.c     | 2 +-
 5 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/lm32/lm32_hwsetup.h b/hw/lm32/lm32_hwsetup.h
index b71e6ea..23e1878 100644
--- a/hw/lm32/lm32_hwsetup.h
+++ b/hw/lm32/lm32_hwsetup.h
@@ -75,7 +75,7 @@ static inline void hwsetup_create_rom(HWSetup *hw,
         hwaddr base)
 {
     rom_add_blob("hwsetup", hw->data, TARGET_PAGE_SIZE,
-                 TARGET_PAGE_SIZE, base, NULL, NULL, NULL);
+                 TARGET_PAGE_SIZE, base, NULL, NULL, NULL, NULL);
 }
 
 static inline void hwsetup_add_u8(HWSetup *hw, uint8_t u)
diff --git a/include/hw/loader.h b/include/hw/loader.h
index 0381706..0c864cf 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -180,7 +180,7 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
                            size_t max_len, hwaddr addr,
                            const char *fw_file_name,
                            FWCfgReadCallback fw_callback,
-                           void *callback_opaque);
+                           void *callback_opaque, AddressSpace *as);
 int rom_add_elf_program(const char *name, void *data, size_t datasize,
                         size_t romsize, hwaddr addr, AddressSpace *as);
 int rom_check_and_register_reset(void);
@@ -194,7 +194,7 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict);
 #define rom_add_file_fixed(_f, _a, _i)          \
     rom_add_file(_f, NULL, _a, _i, false, NULL, NULL)
 #define rom_add_blob_fixed(_f, _b, _l, _a)      \
-    rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL)
+    rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL, NULL)
 #define rom_add_file_mr(_f, _mr, _i)            \
     rom_add_file(_f, NULL, 0, _i, false, _mr, NULL)
 #define rom_add_file_as(_f, _as, _i)            \
@@ -202,7 +202,7 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict);
 #define rom_add_file_fixed_as(_f, _a, _i, _as)          \
     rom_add_file(_f, NULL, _a, _i, false, NULL, _as)
 #define rom_add_blob_fixed_as(_f, _b, _l, _a, _as)      \
-    rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, _as)
+    rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL, _as)
 
 #define PC_ROM_MIN_VGA     0xc0000
 #define PC_ROM_MIN_OPTION  0xc8000
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f953610..d4160df 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -809,7 +809,7 @@ static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
                                        uint64_t max_size)
 {
     return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
-                        name, virt_acpi_build_update, build_state);
+                        name, virt_acpi_build_update, build_state, NULL);
 }
 
 static const VMStateDescription vmstate_virt_acpi_build = {
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 6e022b5..c0d645a 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -978,7 +978,8 @@ err:
 
 MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
                    size_t max_len, hwaddr addr, const char *fw_file_name,
-                   FWCfgReadCallback fw_callback, void *callback_opaque)
+                   FWCfgReadCallback fw_callback, void *callback_opaque,
+                   AddressSpace *as)
 {
     MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
     Rom *rom;
@@ -986,6 +987,7 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
 
     rom           = g_malloc0(sizeof(*rom));
     rom->name     = g_strdup(name);
+    rom->as       = as;
     rom->addr     = addr;
     rom->romsize  = max_len ? max_len : len;
     rom->datasize = len;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 45a2ccf..9708cdc 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2936,7 +2936,7 @@ static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
                                        uint64_t max_size)
 {
     return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
-                        name, acpi_build_update, build_state);
+                        name, acpi_build_update, build_state, NULL);
 }
 
 static const VMStateDescription vmstate_acpi_build = {
-- 
MST

