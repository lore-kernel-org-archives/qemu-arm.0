Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1460733wro;
        Thu, 14 Mar 2019 17:53:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxa/jjHxnkYUnbB0oB34SM00+Ktir6MwOj0zAGZCGWO9OmmaW9nbQxhsQXAAxTAxo7Bv8Mc
X-Received: by 2002:a7b:c216:: with SMTP id x22mr268741wmi.41.1552611227629;
        Thu, 14 Mar 2019 17:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552611227; cv=none;
        d=google.com; s=arc-20160816;
        b=AFSVLSYYsk9KVc2eK1nJ0L84b0KlhVT4RbfL+q6kvxTSqD0OsEX+1yGPvrscGiPqBl
         70+ZGx4XhIHlMxXE7dXFYZLYZkZPP6UyS3yWZIgkk1eu3xVKc86lQt1FTyQRNb2DHj2j
         jxeTD8aIjwp4DfVb6izcrEYE4WunZSWPn+ITUz+0awmjcwR8kLP8DWqPldDeGuxo2Dgm
         Ms2aKyOQJOpwdp85ouZbS/HXCmlr5EIIJ8z2TpfeESqY7fygtrqj5ppA/8wIu408JGDG
         kgdLaPJfqL/HW60Ba3qzeGinipPy3g/oBGkZgap1T7DqloLSN2XJ8Ow1iz2Ik98Ye/Do
         UEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=Q+N0lBn5USMINtLiKh5pRsKWJDR9GXylH/AdU5NVxn0=;
        b=nyCIGNK683kuKleW816D8U1bywHSCzq/Cm7XkMNC3AZHC9aaV3sOz5tedi6PRc9Gno
         USOyEBdV3Apu3Jzhhj5GOnT/Z2Tojv1WeFjYIqD5vx69mUMc0e9RuqIyuu31jJfx4B5M
         VLDxHmqjp6D2w6FxJYiDfyvZPkz259OdlJP/uMq34YYJl1kcS6tDHdBNWPjMKeUW3kYG
         GIqWe9BZFNEjLBtLoAla+6Epgs8f6CulgBIVjar95Fd4/7Lii8odujzVeQ0kPqp1fuIz
         szqTmwU//kAdm6ZT5sWMifZFLP6vdC1X7ROf1IbQzo/sAAZttVKMtRJc6l7P8Ecw8m/q
         zYdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b187si192689wmc.177.2019.03.14.17.53.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 17:53:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:47174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4b6Y-0004Tx-Ii
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 20:53:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h4b6J-0004MO-8S
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 20:53:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h4ay6-0005wg-Hx
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 20:45:03 -0400
Received: from mga06.intel.com ([134.134.136.31]:24121)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1h4ay6-0005tS-0U; Thu, 14 Mar 2019 20:45:02 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Mar 2019 17:44:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,480,1544515200"; d="scan'208";a="214314577"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga001.jf.intel.com with ESMTP; 14 Mar 2019 17:44:57 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 15 Mar 2019 08:44:32 +0800
Message-Id: <20190315004432.3445-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-arm] [PATCH v3] hw/acpi: extract acpi_add_rom_blob()
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	shannon.zhaosl@gmail.com,
	Wei Yang <richardw.yang@linux.intel.com>, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GrLtxR7B2ztq

arm and i386 has almost the same function acpi_add_rom_blob(), except
giving different FWCfgCallback function.

This patch extract acpi_add_rom_blob() to utils.c by passing
FWCfgCallback to it.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

---
v3:
  * put acpi_add_rom_blob() to hw/acpi/utils.c
v2:
  * remove unused header in original source file
---
 hw/acpi/Makefile.objs    |  2 +-
 hw/acpi/utils.c          | 35 +++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c | 26 ++++++++++----------------
 hw/i386/acpi-build.c     | 26 ++++++++++----------------
 include/hw/acpi/utils.h  |  9 +++++++++
 5 files changed, 65 insertions(+), 33 deletions(-)
 create mode 100644 hw/acpi/utils.c
 create mode 100644 include/hw/acpi/utils.h

diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
index 2d46e3789a..ba93c5b64a 100644
--- a/hw/acpi/Makefile.objs
+++ b/hw/acpi/Makefile.objs
@@ -10,7 +10,7 @@ common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
 
 common-obj-y += acpi_interface.o
 common-obj-y += bios-linker-loader.o
-common-obj-y += aml-build.o
+common-obj-y += aml-build.o utils.o
 common-obj-$(CONFIG_TPM) += tpm.o
 
 common-obj-$(CONFIG_IPMI) += ipmi.o
diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
new file mode 100644
index 0000000000..ab0e064a0e
--- /dev/null
+++ b/hw/acpi/utils.c
@@ -0,0 +1,35 @@
+/* Utilities for generating ACPI tables and passing them to Guests
+ *
+ * Copyright (C) 2019 Intel Corporation
+ * Copyright (C) 2019 Red Hat Inc
+ *
+ * Author: Wei Yang <richardw.yang@linux.intel.com>
+ * Author: Igor Mammedov <imammedo@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include <glib/gprintf.h>
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/utils.h"
+
+MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
+                                GArray *blob, const char *name,
+                                uint64_t max_size)
+{
+    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
+                        name, update, opaque, NULL, true);
+}
+
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 57679a89bf..a846f74a14 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -37,9 +37,9 @@
 #include "hw/acpi/acpi.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
-#include "hw/loader.h"
 #include "hw/hw.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/acpi/utils.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
@@ -881,14 +881,6 @@ static void virt_acpi_build_reset(void *build_opaque)
     build_state->patched = false;
 }
 
-static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
-                                       GArray *blob, const char *name,
-                                       uint64_t max_size)
-{
-    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
-                        name, virt_acpi_build_update, build_state, NULL, true);
-}
-
 static const VMStateDescription vmstate_virt_acpi_build = {
     .name = "virt_acpi_build",
     .version_id = 1,
@@ -920,20 +912,22 @@ void virt_acpi_setup(VirtMachineState *vms)
     virt_acpi_build(vms, &tables);
 
     /* Now expose it all to Guest */
-    build_state->table_mr = acpi_add_rom_blob(build_state, tables.table_data,
-                                               ACPI_BUILD_TABLE_FILE,
-                                               ACPI_BUILD_TABLE_MAX_SIZE);
+    build_state->table_mr = acpi_add_rom_blob(virt_acpi_build_update,
+                                              build_state, tables.table_data,
+                                              ACPI_BUILD_TABLE_FILE,
+                                              ACPI_BUILD_TABLE_MAX_SIZE);
     assert(build_state->table_mr != NULL);
 
     build_state->linker_mr =
-        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
-                          "etc/table-loader", 0);
+        acpi_add_rom_blob(virt_acpi_build_update, build_state,
+                          tables.linker->cmd_blob, "etc/table-loader", 0);
 
     fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
                     acpi_data_len(tables.tcpalog));
 
-    build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
-                                              ACPI_BUILD_RSDP_FILE, 0);
+    build_state->rsdp_mr = acpi_add_rom_blob(virt_acpi_build_update,
+                                             build_state, tables.rsdp,
+                                             ACPI_BUILD_RSDP_FILE, 0);
 
     qemu_register_reset(virt_acpi_build_reset, build_state);
     virt_acpi_build_reset(build_state);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 416da318ae..b17d4a711d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -37,7 +37,6 @@
 #include "hw/acpi/cpu.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
-#include "hw/loader.h"
 #include "hw/isa/isa.h"
 #include "hw/block/fdc.h"
 #include "hw/acpi/memory_hotplug.h"
@@ -58,6 +57,7 @@
 #include "hw/i386/x86-iommu.h"
 
 #include "hw/acpi/aml-build.h"
+#include "hw/acpi/utils.h"
 
 #include "qom/qom-qobject.h"
 #include "hw/i386/amd_iommu.h"
@@ -2842,14 +2842,6 @@ static void acpi_build_reset(void *build_opaque)
     build_state->patched = 0;
 }
 
-static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
-                                       GArray *blob, const char *name,
-                                       uint64_t max_size)
-{
-    return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
-                        name, acpi_build_update, build_state, NULL, true);
-}
-
 static const VMStateDescription vmstate_acpi_build = {
     .name = "acpi_build",
     .version_id = 1,
@@ -2891,14 +2883,15 @@ void acpi_setup(void)
     acpi_build(&tables, MACHINE(pcms));
 
     /* Now expose it all to Guest */
-    build_state->table_mr = acpi_add_rom_blob(build_state, tables.table_data,
-                                               ACPI_BUILD_TABLE_FILE,
-                                               ACPI_BUILD_TABLE_MAX_SIZE);
+    build_state->table_mr = acpi_add_rom_blob(acpi_build_update,
+                                              build_state, tables.table_data,
+                                              ACPI_BUILD_TABLE_FILE,
+                                              ACPI_BUILD_TABLE_MAX_SIZE);
     assert(build_state->table_mr != NULL);
 
     build_state->linker_mr =
-        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
-                          "etc/table-loader", 0);
+        acpi_add_rom_blob(acpi_build_update, build_state,
+                          tables.linker->cmd_blob, "etc/table-loader", 0);
 
     fw_cfg_add_file(pcms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
@@ -2935,8 +2928,9 @@ void acpi_setup(void)
         build_state->rsdp_mr = NULL;
     } else {
         build_state->rsdp = NULL;
-        build_state->rsdp_mr = acpi_add_rom_blob(build_state, tables.rsdp,
-                                                  ACPI_BUILD_RSDP_FILE, 0);
+        build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
+                                                 build_state, tables.rsdp,
+                                                 ACPI_BUILD_RSDP_FILE, 0);
     }
 
     qemu_register_reset(acpi_build_reset, build_state);
diff --git a/include/hw/acpi/utils.h b/include/hw/acpi/utils.h
new file mode 100644
index 0000000000..5212113b7d
--- /dev/null
+++ b/include/hw/acpi/utils.h
@@ -0,0 +1,9 @@
+#ifndef HW_ACPI_UTILS_H
+#define HW_ACPI_UTILS_H
+
+#include "hw/loader.h"
+
+MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
+                                GArray *blob, const char *name,
+                                uint64_t max_size);
+#endif
-- 
2.19.1

