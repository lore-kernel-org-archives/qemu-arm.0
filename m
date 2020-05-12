Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp767971lfb;
        Mon, 11 May 2020 20:03:26 -0700 (PDT)
X-Google-Smtp-Source: APiQypKsAxj73/RxMtbY/rrNcT/8VGX25ntN3h7k84UgYQoIPi2dLkmfS7tEW0JXJbgHLxbXmDaa
X-Received: by 2002:a17:906:90c1:: with SMTP id v1mr15182976ejw.322.1589252606588;
        Mon, 11 May 2020 20:03:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589252606; cv=none;
        d=google.com; s=arc-20160816;
        b=R/E2dCU2NTiKGSfE3dMJl9NRcwuSeJF0cgKbMOXYS6M+uazo1RG87M/ZqKzRKAABda
         HZ8hxh9rTd8NjCCrXn9kTGij35gfPtH99PKSj0qoVIaQUt3ZLcuC2eb+MfClOupNPai1
         wo7G/c1hMyQzo5b3FPWcebD4z7nBZ3+zrNZ9Fb/diUlhpSI4uVYNA0/Rf2ZvR4xkRKJ2
         toP96ElxIvwTfxk18hU1VKg8PWytL8qyn9Th8k8y6dWXtG9HHTOLfrH1ZLh+ZMvTRynV
         LGm043pzMYUjq/dIjvObM1qfFCkFuQxRyyF879KxZ2YTt/fnlrhz59nJv83IP7Eim0jk
         s/ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=XKvJGrA8+IeB4ZOxy09vFTPPkmtvTUjp6eHfs/DPTtc=;
        b=tAiMVYLcFMYjwP81Pa9yzFfEaQ3PUf70BxnQ01eWaU0Fx5oHExH0PI2fM/Hm1Tzns0
         7yRhKmOPfU0oaxl9JFsRljZeKh/3ku/SKLpkPOPura9a4DAmyjyYry783ZRK8Y56aATh
         u7H0u1ioXPVRffiYjSOy7E/yGnrXp2wWkeH+GlCqlElSk/Wkzt0J4X/ctSmvNReX3Lx2
         gCx77RyZd59Ay/3QT+jqty/69KvhyizivxbPFcgn753O4YPffEdieLYz+qQcHvocyzOT
         58A4nqBPb2jxTZTMmm5YKwkG1Rdt+fk1CQCUS2CXMMxkgwG86W7ZK45pbWcHmW8T0SmX
         +U5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id l23si1677934edj.333.2020.05.11.20.03.26;
        Mon, 11 May 2020 20:03:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbgELDDY (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 11 May 2020 23:03:24 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4341 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728640AbgELDDX (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 11 May 2020 23:03:23 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id ED0B15F3EDAD25EE8F4A;
        Tue, 12 May 2020 11:03:16 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Tue, 12 May 2020
 11:03:07 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <peter.maydell@linaro.org>,
        <shannon.zhaosl@gmail.com>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>, <pbonzini@redhat.com>, <philmd@redhat.com>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>,
        <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v27 05/10] ACPI: Build Hardware Error Source Table
Date:   Tue, 12 May 2020 11:06:04 +0800
Message-ID: <20200512030609.19593-6-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512030609.19593-1-gengdongjiu@huawei.com>
References: <20200512030609.19593-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: mN4hoSNKqWRi

This patch builds Hardware Error Source Table(HEST) via fw_cfg blobs.
Now it only supports ARMv8 SEA, a type of Generic Hardware Error
Source version 2(GHESv2) error source. Afterwards, we can extend
the supported types if needed. For the CPER section, currently it
is memory section because kernel mainly wants userspace to handle
the memory errors.

This patch follows the spec ACPI 6.2 to build the Hardware Error
Source table. For more detailed information, please refer to
document: docs/specs/acpi_hest_ghes.rst

build_ghes_hw_error_notification() helper will help to add Hardware
Error Notification to ACPI tables without using packed C structures
and avoid endianness issues as API doesn't need explicit conversion.

Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/ghes.c           | 126 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c |   2 +
 include/hw/acpi/ghes.h   |  39 +++++++++++++++
 3 files changed, 167 insertions(+)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index e1b3f8f..091fd87 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -23,6 +23,7 @@
 #include "qemu/units.h"
 #include "hw/acpi/ghes.h"
 #include "hw/acpi/aml-build.h"
+#include "qemu/error-report.h"
 
 #define ACPI_GHES_ERRORS_FW_CFG_FILE        "etc/hardware_errors"
 #define ACPI_GHES_DATA_ADDR_FW_CFG_FILE     "etc/hardware_errors_addr"
@@ -33,6 +34,42 @@
 /* Now only support ARMv8 SEA notification type error source */
 #define ACPI_GHES_ERROR_SOURCE_COUNT        1
 
+/* Generic Hardware Error Source version 2 */
+#define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
+
+/* Address offset in Generic Address Structure(GAS) */
+#define GAS_ADDR_OFFSET 4
+
+/*
+ * Hardware Error Notification
+ * ACPI 4.0: 17.3.2.7 Hardware Error Notification
+ * Composes dummy Hardware Error Notification descriptor of specified type
+ */
+static void build_ghes_hw_error_notification(GArray *table, const uint8_t type)
+{
+    /* Type */
+    build_append_int_noprefix(table, type, 1);
+    /*
+     * Length:
+     * Total length of the structure in bytes
+     */
+    build_append_int_noprefix(table, 28, 1);
+    /* Configuration Write Enable */
+    build_append_int_noprefix(table, 0, 2);
+    /* Poll Interval */
+    build_append_int_noprefix(table, 0, 4);
+    /* Vector */
+    build_append_int_noprefix(table, 0, 4);
+    /* Switch To Polling Threshold Value */
+    build_append_int_noprefix(table, 0, 4);
+    /* Switch To Polling Threshold Window */
+    build_append_int_noprefix(table, 0, 4);
+    /* Error Threshold Value */
+    build_append_int_noprefix(table, 0, 4);
+    /* Error Threshold Window */
+    build_append_int_noprefix(table, 0, 4);
+}
+
 /*
  * Build table for the hardware error fw_cfg blob.
  * Initialize "etc/hardware_errors" and "etc/hardware_errors_addr" fw_cfg blobs.
@@ -87,3 +124,92 @@ void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
     bios_linker_loader_write_pointer(linker, ACPI_GHES_DATA_ADDR_FW_CFG_FILE,
         0, sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE, 0);
 }
+
+/* Build Generic Hardware Error Source version 2 (GHESv2) */
+static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
+{
+    uint64_t address_offset;
+    /*
+     * Type:
+     * Generic Hardware Error Source version 2(GHESv2 - Type 10)
+     */
+    build_append_int_noprefix(table_data, ACPI_GHES_SOURCE_GENERIC_ERROR_V2, 2);
+    /* Source Id */
+    build_append_int_noprefix(table_data, source_id, 2);
+    /* Related Source Id */
+    build_append_int_noprefix(table_data, 0xffff, 2);
+    /* Flags */
+    build_append_int_noprefix(table_data, 0, 1);
+    /* Enabled */
+    build_append_int_noprefix(table_data, 1, 1);
+
+    /* Number of Records To Pre-allocate */
+    build_append_int_noprefix(table_data, 1, 4);
+    /* Max Sections Per Record */
+    build_append_int_noprefix(table_data, 1, 4);
+    /* Max Raw Data Length */
+    build_append_int_noprefix(table_data, ACPI_GHES_MAX_RAW_DATA_LENGTH, 4);
+
+    address_offset = table_data->len;
+    /* Error Status Address */
+    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
+                     4 /* QWord access */, 0);
+    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
+        address_offset + GAS_ADDR_OFFSET, sizeof(uint64_t),
+        ACPI_GHES_ERRORS_FW_CFG_FILE, source_id * sizeof(uint64_t));
+
+    switch (source_id) {
+    case ACPI_HEST_SRC_ID_SEA:
+        /*
+         * Notification Structure
+         * Now only enable ARMv8 SEA notification type
+         */
+        build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_SEA);
+        break;
+    default:
+        error_report("Not support this error source");
+        abort();
+    }
+
+    /* Error Status Block Length */
+    build_append_int_noprefix(table_data, ACPI_GHES_MAX_RAW_DATA_LENGTH, 4);
+
+    /*
+     * Read Ack Register
+     * ACPI 6.1: 18.3.2.8 Generic Hardware Error Source
+     * version 2 (GHESv2 - Type 10)
+     */
+    address_offset = table_data->len;
+    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
+                     4 /* QWord access */, 0);
+    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
+        address_offset + GAS_ADDR_OFFSET,
+        sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
+        (ACPI_GHES_ERROR_SOURCE_COUNT + source_id) * sizeof(uint64_t));
+
+    /*
+     * Read Ack Preserve field
+     * We only provide the first bit in Read Ack Register to OSPM to write
+     * while the other bits are preserved.
+     */
+    build_append_int_noprefix(table_data, ~0x1ULL, 8);
+    /* Read Ack Write */
+    build_append_int_noprefix(table_data, 0x1, 8);
+}
+
+/* Build Hardware Error Source Table */
+void acpi_build_hest(GArray *table_data, BIOSLinker *linker)
+{
+    uint64_t hest_start = table_data->len;
+
+    /* Hardware Error Source Table header*/
+    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+
+    /* Error Source Count */
+    build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
+
+    build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
+
+    build_header(linker, table_data, (void *)(table_data->data + hest_start),
+        "HEST", table_data->len - hest_start, 1, NULL, NULL);
+}
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 8397bda..ef94e03 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -821,6 +821,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     if (vms->ras) {
         build_ghes_error_table(tables->hardware_errors, tables->linker);
+        acpi_add_table(table_offsets, tables_blob);
+        acpi_build_hest(tables_blob, tables->linker);
     }
 
     if (ms->numa_state->num_nodes > 0) {
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 50379b0..18debd8 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -24,5 +24,44 @@
 
 #include "hw/acpi/bios-linker-loader.h"
 
+/*
+ * Values for Hardware Error Notification Type field
+ */
+enum AcpiGhesNotifyType {
+    /* Polled */
+    ACPI_GHES_NOTIFY_POLLED = 0,
+    /* External Interrupt */
+    ACPI_GHES_NOTIFY_EXTERNAL = 1,
+    /* Local Interrupt */
+    ACPI_GHES_NOTIFY_LOCAL = 2,
+    /* SCI */
+    ACPI_GHES_NOTIFY_SCI = 3,
+    /* NMI */
+    ACPI_GHES_NOTIFY_NMI = 4,
+    /* CMCI, ACPI 5.0: 18.3.2.7, Table 18-290 */
+    ACPI_GHES_NOTIFY_CMCI = 5,
+    /* MCE, ACPI 5.0: 18.3.2.7, Table 18-290 */
+    ACPI_GHES_NOTIFY_MCE = 6,
+    /* GPIO-Signal, ACPI 6.0: 18.3.2.7, Table 18-332 */
+    ACPI_GHES_NOTIFY_GPIO = 7,
+    /* ARMv8 SEA, ACPI 6.1: 18.3.2.9, Table 18-345 */
+    ACPI_GHES_NOTIFY_SEA = 8,
+    /* ARMv8 SEI, ACPI 6.1: 18.3.2.9, Table 18-345 */
+    ACPI_GHES_NOTIFY_SEI = 9,
+    /* External Interrupt - GSIV, ACPI 6.1: 18.3.2.9, Table 18-345 */
+    ACPI_GHES_NOTIFY_GSIV = 10,
+    /* Software Delegated Exception, ACPI 6.2: 18.3.2.9, Table 18-383 */
+    ACPI_GHES_NOTIFY_SDEI = 11,
+    /* 12 and greater are reserved */
+    ACPI_GHES_NOTIFY_RESERVED = 12
+};
+
+enum {
+    ACPI_HEST_SRC_ID_SEA = 0,
+    /* future ids go here */
+    ACPI_HEST_SRC_ID_RESERVED,
+};
+
 void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
+void acpi_build_hest(GArray *table_data, BIOSLinker *linker);
 #endif
-- 
1.8.3.1
