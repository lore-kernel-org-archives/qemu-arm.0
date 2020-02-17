Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4524006lfp;
        Sun, 16 Feb 2020 17:25:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqyhh/sVb6w5xP15ytcANiW1z0cj1jx4nAeD0svHZPzvPdQmDx7qYfLMzL++iWK5TZmYUTn3
X-Received: by 2002:a54:4816:: with SMTP id j22mr8620578oij.179.1581902735459;
        Sun, 16 Feb 2020 17:25:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581902735; cv=none;
        d=google.com; s=arc-20160816;
        b=H2yjdViKT5wsCPiOvy2q4oaHMHwI0InuJWuajdYmqMzzRkwmhddsc+6FPqpEJsUL/H
         6iG82u+c3hmVdCQOgFeNJIdnL/InnQuc7on15CAHN83MlpBqcrHwd1uiY3b9SsoGtHEf
         793JC+5vVEJpbw8BnHFjs9HuYUTY9eV4ndPTVB5FCia3PZ3Pldd4cGbBu3ZTK2hBamek
         dFq3Hlo9WbQiyPrX/W3zLzdqKkwRRpTaqmaU4XzIYi/O/OLA1bkCVnc2zYDftZdVvQPI
         x5diXWwIwxpM+ABNbPBCEBF1RNrtYDroqcY13k4O4SZNqPa5uUEXB2dCSgaC5exi/MuG
         HJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=MHHO9xTPWNF3jFmVmqR7R0Y1Y70mpAX38BQXvciyb3I=;
        b=NJex7LAKsNxQ7bMDDuP3SU+pbUiieRRfMrvHV1+IMUEN+fHYaCRK/aCH31+Ppfmp1a
         Mgps+9EPIW/IeQmhSc45i4ojpicrGobvWJFGLYO5WT+mRfgJ2+TOINfpGSPZ2hY7l0UG
         Zc57EeTZbDSZUsKBDPp5+EGHn0rsDNVKJOoPBvnSb7YyOx2G4zg2UPYjWP4NgYKIOOj8
         TZN9FvoIbuL1S1hjAsAf/3N2XwpXYPxP2Q9ZZuCpeCFtbl31zS0pRHmI5ZMJeBz4USvA
         /wIoyO+kTbjYpgD8rY5+v5c5AGIRvRHdD+EI1KI2dyiu7eaaQX/4cEo8E+ybBewkpqAx
         hwxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id z14si5843662oth.15.2020.02.16.17.25.35;
        Sun, 16 Feb 2020 17:25:35 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgBQBZe (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Sun, 16 Feb 2020 20:25:34 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10185 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726766AbgBQBZd (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 16 Feb 2020 20:25:33 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E985D334EBB9A0DC04DC;
        Mon, 17 Feb 2020 09:25:27 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Mon, 17 Feb 2020
 09:25:21 +0800
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
Subject: [PATCH RESEND v23 06/10] ACPI: Record the Generic Error Status Block address
Date:   Mon, 17 Feb 2020 09:27:33 +0800
Message-ID: <20200217012737.30231-7-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20200217012737.30231-1-gengdongjiu@huawei.com>
References: <20200217012737.30231-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: rpQj7Z2PGq9V

Record the GHEB address via fw_cfg file, when recording
a error to CPER, it will use this address to find out
Generic Error Data Entries and write the error.

In order to avoid migration failure, make hardware
error table address to a part of GED device instead
of global variable, then this address will be migrated
to target QEMU.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Acked-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 hw/acpi/generic_event_device.c         | 18 ++++++++++++++++++
 hw/acpi/ghes.c                         | 17 +++++++++++++++++
 hw/arm/virt-acpi-build.c               | 10 ++++++++++
 include/hw/acpi/generic_event_device.h |  2 ++
 include/hw/acpi/ghes.h                 |  6 ++++++
 5 files changed, 53 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 021ed2b..d59607c 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -234,6 +234,23 @@ static const VMStateDescription vmstate_ged_state = {
     }
 };
 
+static bool ghes_needed(void *opaque)
+{
+    return object_property_get_bool(qdev_get_machine(), "ras", NULL);
+}
+
+static const VMStateDescription vmstate_ghes_state = {
+    .name = "acpi-ged/ghes",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = ghes_needed,
+    .fields      = (VMStateField[]) {
+        VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
+                       vmstate_ghes_state, AcpiGhesState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_acpi_ged = {
     .name = "acpi-ged",
     .version_id = 1,
@@ -244,6 +261,7 @@ static const VMStateDescription vmstate_acpi_ged = {
     },
     .subsections = (const VMStateDescription * []) {
         &vmstate_memhp_state,
+        &vmstate_ghes_state,
         NULL
     }
 };
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 7a7381d..cea2bff 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -24,6 +24,8 @@
 #include "hw/acpi/ghes.h"
 #include "hw/acpi/aml-build.h"
 #include "qemu/error-report.h"
+#include "hw/acpi/generic_event_device.h"
+#include "hw/nvram/fw_cfg.h"
 
 #define ACPI_GHES_ERRORS_FW_CFG_FILE        "etc/hardware_errors"
 #define ACPI_GHES_DATA_ADDR_FW_CFG_FILE     "etc/hardware_errors_addr"
@@ -213,3 +215,18 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker)
     build_header(linker, table_data, (void *)(table_data->data + hest_start),
         "HEST", table_data->len - hest_start, 1, NULL, "");
 }
+
+void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
+                          GArray *hardware_error)
+{
+    size_t size = 2 * sizeof(uint64_t) + ACPI_GHES_MAX_RAW_DATA_LENGTH;
+    size_t request_block_size = ACPI_GHES_ERROR_SOURCE_COUNT * size;
+
+    /* Create a read-only fw_cfg file for GHES */
+    fw_cfg_add_file(s, ACPI_GHES_ERRORS_FW_CFG_FILE, hardware_error->data,
+                    request_block_size);
+
+    /* Create a read-write fw_cfg file for Address */
+    fw_cfg_add_file_callback(s, ACPI_GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL,
+        NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
+}
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 12a9a78..d6e7521 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -832,6 +832,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_spcr(tables_blob, tables->linker, vms);
 
     if (vms->ras) {
+        assert(vms->acpi_dev);
         acpi_add_table(table_offsets, tables_blob);
         build_ghes_error_table(tables->hardware_errors, tables->linker);
         acpi_build_hest(tables_blob, tables->linker);
@@ -924,6 +925,7 @@ void virt_acpi_setup(VirtMachineState *vms)
 {
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
+    AcpiGedState *acpi_ged_state;
 
     if (!vms->fw_cfg) {
         trace_virt_acpi_setup();
@@ -954,6 +956,14 @@ void virt_acpi_setup(VirtMachineState *vms)
     fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
                     acpi_data_len(tables.tcpalog));
 
+    if (vms->ras) {
+        assert(vms->acpi_dev);
+        acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
+                                                           NULL));
+        acpi_ghes_add_fw_cfg(&acpi_ged_state->ghes_state,
+                             vms->fw_cfg, tables.hardware_errors);
+    }
+
     build_state->rsdp_mr = acpi_add_rom_blob(virt_acpi_build_update,
                                              build_state, tables.rsdp,
                                              ACPI_BUILD_RSDP_FILE, 0);
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index d157eac..037d2b5 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -61,6 +61,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/acpi/memory_hotplug.h"
+#include "hw/acpi/ghes.h"
 
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
 
@@ -95,6 +96,7 @@ typedef struct AcpiGedState {
     GEDState ged_state;
     uint32_t ged_event_bitmap;
     qemu_irq irq;
+    AcpiGhesState ghes_state;
 } AcpiGedState;
 
 void build_ged_aml(Aml *table, const char* name, HotplugHandler *hotplug_dev,
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 18debd8..a3420fc 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -62,6 +62,12 @@ enum {
     ACPI_HEST_SRC_ID_RESERVED,
 };
 
+typedef struct AcpiGhesState {
+    uint64_t ghes_addr_le;
+} AcpiGhesState;
+
 void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
 void acpi_build_hest(GArray *table_data, BIOSLinker *linker);
+void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
+                          GArray *hardware_errors);
 #endif
-- 
1.8.3.1
