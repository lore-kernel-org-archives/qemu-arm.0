Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4578667wrx;
        Mon, 25 Mar 2019 19:46:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzYuTGPldQtNXI01IZJxO4yr/d/CYHfYB1cgqZWcOXNbeptN4iICWY9Q81NwKBYH7cH3ja4
X-Received: by 2002:a25:40d8:: with SMTP id n207mr23312129yba.427.1553568406691;
        Mon, 25 Mar 2019 19:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553568406; cv=none;
        d=google.com; s=arc-20160816;
        b=zWJRDMrjBtWaUfidn6crpX68B22vQH2KTnwZDmQ69+1FSw6G7u9QwL6CnjFZFhcifl
         52vtCvGpREAbeygT8PrZxXyt9rmE4ZW2H8P7INNl8LQGIql9xLDv11y3sp2fANynRFtL
         AS493YID5BWdeG4lG+H9B9IWk4O76XfhCTzZUuDqW/p80G6cxjZT8qojV9xaYPnXYBtw
         PNP8hPCecYaIWbwkXMx7wfJwI6yM/u8oc0TZ8EL4UfW4uwGpbUiaR/2AFXFpIYGYRT6O
         iCygbz6c/3jpsGQ8XV7Azec5UUICCzByHsM54OYPXdF/F91kbth3Y3AcbCqQfu38NqgZ
         gqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=dTl1OOww7HOKPObLlRbEJbZy1jPYg01eapc31fQrfvY=;
        b=nmhIoNI6freCbOQ5hXgcQIAA/UDRf5ShZquWgmE7fihXi6ytcgxiJT5Zbh3euK3Bq5
         pO0w9WhvlOp7BR1yWqSgMN7Z6V5+z6y4lixU8KcGJTpIAYjXuIUc6nU1hjZ1k1HFnAcp
         eSAuxF07pej5qEvSpbVKElOIyrQDKpXXui7+E4BEE84AZvnaPCEQWwA9j6r0PL7qkEKC
         yUpryeAfr8voaBvvwhn/zjAlI1zuFk1I+44k65ZvpRkGLd17BpKkUVGY+2pb37DucYPx
         pG/+ujSaSH48+bs/I9V7yGsEGXCwawKMQ2lW/V4Z79KsVS+FzNUu1oJ6LzKl3BVzu3dp
         4DsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g63si10030411ybg.29.2019.03.25.19.46.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 19:46:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:51637 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8c6w-00034D-33
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 22:46:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h8c6V-0002y2-CA
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 22:46:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h8c44-0006i4-9N
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 22:43:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:46745)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1h8c42-0006hW-DR; Mon, 25 Mar 2019 22:43:46 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Mar 2019 19:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,271,1549958400"; d="scan'208";a="330665900"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga006.fm.intel.com with ESMTP; 25 Mar 2019 19:43:42 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 26 Mar 2019 10:43:20 +0800
Message-Id: <20190326024320.27895-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-devel] [PATCH v6] hw/acpi: extract acpi_add_rom_blob()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	shannon.zhaosl@gmail.com,
	Wei Yang <richardw.yang@linux.intel.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bg7rOYsXrOBY

arm and i386 has almost the same function acpi_add_rom_blob(), except
giving different FWCfgCallback function.

This patch moves acpi_add_rom_blob() to utils.c by passing
FWCfgCallback to it.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---
v6:
  * change author from Igor to Michael
v5:
  * remove unnecessary header glib/gprintf.h
  * rearrange include header to make it more suitable
v4:
  * extract -> moves
  * adjust comment in source to make checkpatch happy
v3:
  * put acpi_add_rom_blob() to hw/acpi/utils.c
v2:
  * remove unused header in original source file

author
---
 hw/acpi/Makefile.objs    |  2 +-
 hw/acpi/utils.c          | 36 ++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c | 26 ++++++++++----------------
 hw/i386/acpi-build.c     | 26 ++++++++++----------------
 include/hw/acpi/utils.h  |  9 +++++++++
 5 files changed, 66 insertions(+), 33 deletions(-)
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
index 0000000000..77b9e8148f
--- /dev/null
+++ b/hw/acpi/utils.c
@@ -0,0 +1,36 @@
+/*
+ * Utilities for generating ACPI tables and passing them to Guests
+ *
+ * Copyright (C) 2019 Intel Corporation
+ * Copyright (C) 2019 Red Hat Inc
+ *
+ * Author: Wei Yang <richardw.yang@linux.intel.com>
+ * Author: Michael S. Tsirkin <mst@redhat.com>
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
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/utils.h"
+#include "hw/loader.h"
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
index 0000000000..140b4de603
--- /dev/null
+++ b/include/hw/acpi/utils.h
@@ -0,0 +1,9 @@
+#ifndef HW_ACPI_UTILS_H
+#define HW_ACPI_UTILS_H
+
+#include "hw/nvram/fw_cfg.h"
+
+MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
+                                GArray *blob, const char *name,
+                                uint64_t max_size);
+#endif
-- 
2.19.1

