Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp614745lff;
        Wed, 8 Jan 2020 03:32:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqx4EWuQRH/pN9GH1TMbqdAGLmezx4qUFynQeUb9HiWl18O9Rs3JjlaCEws4Y28tiq2YC6vW
X-Received: by 2002:a9d:21f4:: with SMTP id s107mr3949330otb.102.1578483163841;
        Wed, 08 Jan 2020 03:32:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578483163; cv=none;
        d=google.com; s=arc-20160816;
        b=sKVTzMXAhKxoURA66AYkawNUfNbiT/vRoPsoBolHSIndqUYXFD85saOyHK5Fr1S/ek
         eaO3D9aWPio6C4pdDsmLJyq8EuJFd1GL3bWBEBIreHmCyI/OS3nlWJEqq7O2SeyK+GIA
         f5HxnU+AHjk6vq6RtqSxl17cxb0CY97ibONuQR5IdzcL0JnaBzUAjljMwj1BfO5ln0iF
         Yi2ojnhdujqsTLIGligYVbTCAx1o3NakQJcrNlIDl2ABHushyzfSZBBLObE+esDNqpZn
         yy8JeuJKJH7wZg+c2JFVLP0v8AAaGt1FObr6j7bgWaMg89sD+3TzsCv7TID3DTPxLLMi
         PBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=LOV3w0pg0HIKf4aBi/WkZb5ewekEfiYoyBwFC9oB0bg=;
        b=zi+V8xDyZb71RbQKzCBq8ap1MNow93Q/2WxSLVtBGqiLqZxdOnAapwDSDaNIuf/Jlf
         nn4s7Wo4NF1zqiaiNYLeSvInkBFcwy0KFXeUO/flFwhkuGimfoyZQPYIpD/Wh0XhdJjI
         BBjfVbiom5kHoAEr3IjAaJjFgZK9Ygs5gd5voxV2/YwHN0IvcaWX1EqfGoMLic9qd6mh
         2XJYKKatyQXvNj/v49PYNOsx8kVoazwKb5YvcONal6qcxzm41df0sWZGFx4ikBp3Dqqf
         bNSzvKD3h0jwjDl26zd5CvEk+NW3E3pU8kbQo7HZBU5IJ3PHjP8o+8y2L1TczEhHYYny
         I2rw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a12si1673119oie.87.2020.01.08.03.32.43;
        Wed, 08 Jan 2020 03:32:43 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbgAHLcm (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Wed, 8 Jan 2020 06:32:42 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:34722 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726891AbgAHLck (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 8 Jan 2020 06:32:40 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id C611F54EA6A0E52F86F0;
        Wed,  8 Jan 2020 19:32:37 +0800 (CST)
Received: from localhost.localdomain (10.151.151.249) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Wed, 8 Jan 2020 19:32:29 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <gengdongjiu@huawei.com>, <mst@redhat.com>,
        <imammedo@redhat.com>, <shannon.zhaosl@gmail.com>,
        <peter.maydell@linaro.org>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>, <xuwei5@huawei.com>,
        <jonathan.cameron@huawei.com>, <james.morse@arm.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>
CC:     <zhengxiang9@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v22 5/9] ACPI: Record the Generic Error Status Block address
Date:   Wed, 8 Jan 2020 19:32:19 +0800
Message-ID: <1578483143-14905-6-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
References: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.249]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: mxFhmrfysZ82

Record the GHEB address via fw_cfg file, when recording
a error to CPER, it will use this address to find out
Generic Error Data Entries and write the error.

Make the HEST GHES to a GED device.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 hw/acpi/generic_event_device.c         | 15 ++++++++++++++-
 hw/acpi/ghes.c                         | 16 ++++++++++++++++
 hw/arm/virt-acpi-build.c               | 13 ++++++++++++-
 include/hw/acpi/generic_event_device.h |  2 ++
 include/hw/acpi/ghes.h                 |  6 ++++++
 5 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 9cee90c..9bf37e4 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -234,12 +234,25 @@ static const VMStateDescription vmstate_ged_state = {
     }
 };
 
+static const VMStateDescription vmstate_ghes_state = {
+    .name = "acpi-ghes-state",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields      = (VMStateField[]) {
+        VMSTATE_UINT64(ghes_addr_le, AcpiGhesState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_acpi_ged = {
     .name = "acpi-ged",
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_STRUCT(ged_state, AcpiGedState, 1, vmstate_ged_state, GEDState),
+        VMSTATE_STRUCT(ged_state, AcpiGedState, 1,
+                       vmstate_ged_state, GEDState),
+        VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
+                       vmstate_ghes_state, AcpiGhesState),
         VMSTATE_END_OF_LIST(),
     },
     .subsections = (const VMStateDescription * []) {
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 9d37798..68f4abf 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -23,6 +23,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ghes.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/acpi/generic_event_device.h"
 #include "hw/nvram/fw_cfg.h"
 #include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
@@ -208,3 +209,18 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
     build_header(linker, table_data, (void *)(table_data->data + hest_start),
         "HEST", table_data->len - hest_start, 1, NULL, "");
 }
+
+void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
+                            GArray *hardware_error)
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
index 837bbf9..c8aa94d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -797,6 +797,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     unsigned dsdt, xsdt;
     GArray *tables_blob = tables->table_data;
     MachineState *ms = MACHINE(vms);
+    AcpiGedState *acpi_ged_state;
 
     table_offsets = g_array_new(false, true /* clear */,
                                         sizeof(uint32_t));
@@ -831,7 +832,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);
 
-    if (vms->ras) {
+    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
+                                                       NULL));
+    if (acpi_ged_state &&  vms->ras) {
         acpi_add_table(table_offsets, tables_blob);
         build_ghes_error_table(tables->hardware_errors, tables->linker);
         acpi_build_hest(tables_blob, tables->hardware_errors,
@@ -925,6 +928,7 @@ void virt_acpi_setup(VirtMachineState *vms)
 {
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
+    AcpiGedState *acpi_ged_state;
 
     if (!vms->fw_cfg) {
         trace_virt_acpi_setup();
@@ -955,6 +959,13 @@ void virt_acpi_setup(VirtMachineState *vms)
     fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
                     acpi_data_len(tables.tcpalog));
 
+    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
+                                                       NULL));
+    if (acpi_ged_state && vms->ras) {
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
index 09a7f86..a6761e6 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -60,7 +60,13 @@ enum {
     ACPI_HEST_SRC_ID_RESERVED,
 };
 
+typedef struct AcpiGhesState {
+    uint64_t ghes_addr_le;
+} AcpiGhesState;
+
 void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
 void acpi_build_hest(GArray *table_data, GArray *hardware_error,
                           BIOSLinker *linker);
+void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
+                          GArray *hardware_errors);
 #endif
-- 
1.8.3.1
