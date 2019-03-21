Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp172098wrt;
        Wed, 20 Mar 2019 17:34:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxCqQi+lbiCgSVgFPxC7ngghOOk/5QepHzyVXo46xwcsVIb6WxHaCi1+SgapFKiWCNfE9bC
X-Received: by 2002:a5d:6b12:: with SMTP id v18mr589395wrw.27.1553128471632;
        Wed, 20 Mar 2019 17:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553128471; cv=none;
        d=google.com; s=arc-20160816;
        b=OMSM56MGVyg12opB5NxpO+7PPJeVovyocz1vLWwZb+CRLdTxZOXZ/vkwuhZbmJQHf0
         eYH1Vcb+vIftPfCCzDy6QeKI99a/kipDVYll8V2cBaszsc1BXnUsbt9Pj6D1vtKo3Dh5
         lxYt1Qk86slUaQKvcc5IjJbsGMFGeIn2O5iLFRcBi/0rBDVm5sqlJwbjLfUdVg+6I0oP
         gaFOcyaxUw6OpDOBlSlEGIktvG8lPLIdn2W0Wh0S21Xc353ULymngamdP+R+4d4d5QOr
         9l2TJyhMnZaWqXev5WxqgEwVDfV/AA/WVQXhKiPF93ROCp7O7tQjhyR3QBzK0Zd+jUNq
         nPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=MVxjkIspmhQhc4Nqh32rnM58WQDWbom8ozadIM8WRIA=;
        b=B/8sQPOWM6b+cHjrh3F4CU/+IlinXI2EEPdNL6y34ZMoz1TWlHwWpfGcdMqCYEODn/
         OgInbluFuDOHymb6jRrKL0mwj8TFdys42BPxrJl4m3REXiMPoG9Zx4ipT772Z/OEtdGz
         6J3hDWV5Fyg2u0kbZ32oYFHvnUETdn2JugNbWzBt0xpvu5aV3mg2H0Yu3ySTIykHZOx6
         lNQcJep1AAmMB2SVH2iI1Am3nI2gy0OlA6T17gTGySk1ohfP1f4xRPyfoM98fTMdRHoI
         +9IxUvTNYgTx9oCqc4P1VlbNsvN9zkjY55kgCkamMeVfGkk5jxAySQdDxilr1mIkyT6o
         3pIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16si2250734wri.167.2019.03.20.17.34.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Mar 2019 17:34:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:57298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6lfC-0005m7-LG
	for alex.bennee@linaro.org; Wed, 20 Mar 2019 20:34:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h6leq-0005Kx-Ct
	for qemu-arm@nongnu.org; Wed, 20 Mar 2019 20:34:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h6lTd-0006jh-51
	for qemu-arm@nongnu.org; Wed, 20 Mar 2019 20:22:36 -0400
Received: from mga18.intel.com ([134.134.136.126]:9102)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1h6lTV-0006Xn-LG; Wed, 20 Mar 2019 20:22:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2019 17:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,250,1549958400"; d="scan'208";a="124442575"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga007.jf.intel.com with ESMTP; 20 Mar 2019 17:22:20 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 21 Mar 2019 08:21:53 +0800
Message-Id: <20190321002153.24049-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-arm] [PATCH v4] hw/acpi: extract acpi_add_rom_blob()
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
X-TUID: xMEu95rJK0mw

arm and i386 has almost the same function acpi_add_rom_blob(), except
giving different FWCfgCallback function.

This patch moves acpi_add_rom_blob() to utils.c by passing
FWCfgCallback to it.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

---
v4:
  * extract -> moves
  * adjust comment in source to make checkpatch happy
v3:
  * put acpi_add_rom_blob() to hw/acpi/utils.c
v2:
  * remove unused header in original source file
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
index 0000000000..9747996c8c
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

