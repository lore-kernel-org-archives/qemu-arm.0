Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5055419lfp;
        Mon, 17 Feb 2020 05:10:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqxgrwhWEhTb3jpUjTQjoA/lb2n70WEjROIvOZdcwZvfs63ULxZUvZy/nGQNfB2iwwxib6mU
X-Received: by 2002:a05:6830:114f:: with SMTP id x15mr11638435otq.291.1581945046813;
        Mon, 17 Feb 2020 05:10:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581945046; cv=none;
        d=google.com; s=arc-20160816;
        b=xNasBm5SmSRLkQapVJxS0BvhDW14ui5s3s2BzpBC75BrLAfw/tauni2MgTy5aT2kVX
         1RQoIyY+loc8BQhF9O0Fqy417N4M1AMOCs4l3RYrLzaSOq351sFQ3x1IT9IfMSOvC26a
         7VdcOGBbh4JYoHGIzR1HDO0hpXKRiZoAV7wC7nEaCWl4XwS7Uy0h+dXjtacTn6krMeRd
         vRKeAw2sne7VLmXxWKQ+2unubgqwA+OJCaPJVD9uaR63FqZsSPgt4C+BcFpKV7ybaa5o
         H8JMRwFDKcQ3QHCt7gTfn18NQMHT9MpaB7tnUoTCsn3zIVBHKotjsddUM/0WGuojtz0S
         PLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=heqwEG5w3vsX2x8Fg03lvQkqFqvuUgPzGGipZjbM0V4=;
        b=oklriib9nsBBqzbcx8HZgHJ3IuFLLprUS2gIvWQVdLTfYiJnpKzjf+obZhtgtF6Nva
         EanxnAfsNi2b2ujNjkLWExaGr5kDGajXTuiVh446raPbQpU3easrVSYPo4mPo7n4Hime
         uHYZ/1Uz2J2H68Mi9nX+5C0CZQKSsi2GL04RQr/ZHrhzLaQD2yfK+XBQC6BxvLs2MH61
         gqREnzub+zKniiapNcfTrOmv+VcVQfjRccoabFVH0EgEWn7fL/IAE9453UT0QM8CG+SB
         PHS6ZUjzxGkt8qGYAP40F4IFkiBFwTmunl9VniHsi6AO+LB7yT7SumYpWDPbXEzmsx1j
         JsAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b10si5923172oic.153.2020.02.17.05.10.46;
        Mon, 17 Feb 2020 05:10:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbgBQNKp (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 17 Feb 2020 08:10:45 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10193 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728123AbgBQNKp (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 17 Feb 2020 08:10:45 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 2381C1F579A3F93FE6E3;
        Mon, 17 Feb 2020 21:10:41 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 17 Feb 2020
 21:10:31 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <mst@redhat.com>, <imammedo@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <shannon.zhaosl@gmail.com>,
        <peter.maydell@linaro.org>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>, <pbonzini@redhat.com>,
        <james.morse@arm.com>, <lersek@redhat.com>,
        <jonathan.cameron@huawei.com>,
        <shameerali.kolothum.thodi@huawei.com>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>
Subject: [PATCH v24 04/10] ACPI: Build related register address fields via hardware error fw_cfg blob
Date:   Mon, 17 Feb 2020 21:12:42 +0800
Message-ID: <20200217131248.28273-5-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20200217131248.28273-1-gengdongjiu@huawei.com>
References: <20200217131248.28273-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: XyNapCApivHu

This patch builds error_block_address and read_ack_register fields
in hardware errors table , the error_block_address points to Generic
Error Status Block(GESB) via bios_linker. The max size for one GESB
is 1kb in bytes, For more detailed information, please refer to
document: docs/specs/acpi_hest_ghes.rst

Now we only support one Error source, if necessary, we can extend to
support more.

Suggested-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 default-configs/arm-softmmu.mak |  1 +
 hw/acpi/Kconfig                 |  4 ++
 hw/acpi/Makefile.objs           |  1 +
 hw/acpi/aml-build.c             |  2 +
 hw/acpi/ghes.c                  | 89 +++++++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c        |  6 +++
 include/hw/acpi/aml-build.h     |  1 +
 include/hw/acpi/ghes.h          | 28 +++++++++++++
 8 files changed, 132 insertions(+)
 create mode 100644 hw/acpi/ghes.c
 create mode 100644 include/hw/acpi/ghes.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 645e620..7648be0 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -41,3 +41,4 @@ CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
 CONFIG_SEMIHOSTING=y
+CONFIG_ACPI_APEI=y
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 54209c6..1932f66 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -28,6 +28,10 @@ config ACPI_HMAT
     bool
     depends on ACPI
 
+config ACPI_APEI
+    bool
+    depends on ACPI
+
 config ACPI_PCI
     bool
     depends on ACPI && PCI
diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
index 777da07..28c5ddb 100644
--- a/hw/acpi/Makefile.objs
+++ b/hw/acpi/Makefile.objs
@@ -8,6 +8,7 @@ common-obj-$(CONFIG_ACPI_NVDIMM) += nvdimm.o
 common-obj-$(CONFIG_ACPI_VMGENID) += vmgenid.o
 common-obj-$(CONFIG_ACPI_HW_REDUCED) += generic_event_device.o
 common-obj-$(CONFIG_ACPI_HMAT) += hmat.o
+common-obj-$(CONFIG_ACPI_APEI) += ghes.o
 common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
 common-obj-$(call lnot,$(CONFIG_PC)) += acpi-x86-stub.o
 
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 2c3702b..3681ec6 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1578,6 +1578,7 @@ void acpi_build_tables_init(AcpiBuildTables *tables)
     tables->table_data = g_array_new(false, true /* clear */, 1);
     tables->tcpalog = g_array_new(false, true /* clear */, 1);
     tables->vmgenid = g_array_new(false, true /* clear */, 1);
+    tables->hardware_errors = g_array_new(false, true /* clear */, 1);
     tables->linker = bios_linker_loader_init();
 }
 
@@ -1588,6 +1589,7 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
     g_array_free(tables->table_data, true);
     g_array_free(tables->tcpalog, mfre);
     g_array_free(tables->vmgenid, mfre);
+    g_array_free(tables->hardware_errors, mfre);
 }
 
 /*
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
new file mode 100644
index 0000000..e1b3f8f
--- /dev/null
+++ b/hw/acpi/ghes.c
@@ -0,0 +1,89 @@
+/*
+ * Support for generating APEI tables and recording CPER for Guests
+ *
+ * Copyright (c) 2020 HUAWEI TECHNOLOGIES CO., LTD.
+ *
+ * Author: Dongjiu Geng <gengdongjiu@huawei.com>
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
+#include "qemu/units.h"
+#include "hw/acpi/ghes.h"
+#include "hw/acpi/aml-build.h"
+
+#define ACPI_GHES_ERRORS_FW_CFG_FILE        "etc/hardware_errors"
+#define ACPI_GHES_DATA_ADDR_FW_CFG_FILE     "etc/hardware_errors_addr"
+
+/* The max size in bytes for one error block */
+#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
+
+/* Now only support ARMv8 SEA notification type error source */
+#define ACPI_GHES_ERROR_SOURCE_COUNT        1
+
+/*
+ * Build table for the hardware error fw_cfg blob.
+ * Initialize "etc/hardware_errors" and "etc/hardware_errors_addr" fw_cfg blobs.
+ * See docs/specs/acpi_hest_ghes.rst for blobs format.
+ */
+void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
+{
+    int i, error_status_block_offset;
+
+    /* Build error_block_address */
+    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
+        build_append_int_noprefix(hardware_errors, 0, sizeof(uint64_t));
+    }
+
+    /* Build read_ack_register */
+    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
+        /*
+         * Initialize the value of read_ack_register to 1, so GHES can be
+         * writeable after (re)boot.
+         * ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
+         * (GHESv2 - Type 10)
+         */
+        build_append_int_noprefix(hardware_errors, 1, sizeof(uint64_t));
+    }
+
+    /* Generic Error Status Block offset in the hardware error fw_cfg blob */
+    error_status_block_offset = hardware_errors->len;
+
+    /* Reserve space for Error Status Data Block */
+    acpi_data_push(hardware_errors,
+        ACPI_GHES_MAX_RAW_DATA_LENGTH * ACPI_GHES_ERROR_SOURCE_COUNT);
+
+    /* Tell guest firmware to place hardware_errors blob into RAM */
+    bios_linker_loader_alloc(linker, ACPI_GHES_ERRORS_FW_CFG_FILE,
+                             hardware_errors, sizeof(uint64_t), false);
+
+    for (i = 0; i < ACPI_GHES_ERROR_SOURCE_COUNT; i++) {
+        /*
+         * Tell firmware to patch error_block_address entries to point to
+         * corresponding "Generic Error Status Block"
+         */
+        bios_linker_loader_add_pointer(linker,
+            ACPI_GHES_ERRORS_FW_CFG_FILE, sizeof(uint64_t) * i,
+            sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
+            error_status_block_offset + i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
+    }
+
+    /*
+     * tell firmware to write hardware_errors GPA into
+     * hardware_errors_addr fw_cfg, once the former has been initialized.
+     */
+    bios_linker_loader_write_pointer(linker, ACPI_GHES_DATA_ADDR_FW_CFG_FILE,
+        0, sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE, 0);
+}
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index bd5f771..6819fcf 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -48,6 +48,7 @@
 #include "sysemu/reset.h"
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
+#include "hw/acpi/ghes.h"
 
 #define ARM_SPI_BASE 32
 
@@ -830,6 +831,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);
 
+    if (vms->ras) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_ghes_error_table(tables->hardware_errors, tables->linker);
+    }
+
     if (ms->numa_state->num_nodes > 0) {
         acpi_add_table(table_offsets, tables_blob);
         build_srat(tables_blob, tables->linker, vms);
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index de4a406..8f13620 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -220,6 +220,7 @@ struct AcpiBuildTables {
     GArray *rsdp;
     GArray *tcpalog;
     GArray *vmgenid;
+    GArray *hardware_errors;
     BIOSLinker *linker;
 } AcpiBuildTables;
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
new file mode 100644
index 0000000..50379b0
--- /dev/null
+++ b/include/hw/acpi/ghes.h
@@ -0,0 +1,28 @@
+/*
+ * Support for generating APEI tables and recording CPER for Guests
+ *
+ * Copyright (c) 2020 HUAWEI TECHNOLOGIES CO., LTD.
+ *
+ * Author: Dongjiu Geng <gengdongjiu@huawei.com>
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
+#ifndef ACPI_GHES_H
+#define ACPI_GHES_H
+
+#include "hw/acpi/bios-linker-loader.h"
+
+void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
+#endif
-- 
1.8.3.1
