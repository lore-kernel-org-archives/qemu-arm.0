Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp567687lfm;
        Fri, 10 Apr 2020 04:45:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypJsdANTzqd7KVLkEYtQLJ/1NzVWPnloRMu2pMXYffBsCKO5FDi/A06MYIuft0M2Ca7Ux4Bo
X-Received: by 2002:a05:6214:1923:: with SMTP id es3mr4716092qvb.157.1586519142206;
        Fri, 10 Apr 2020 04:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586519142; cv=none;
        d=google.com; s=arc-20160816;
        b=jE4fBeP/SIl/JulUOq04OjX0dlkN6YrD0Q+qbePA4izWhmwFUlXHpZSetZW1D4PWKT
         e75t8rmRErflRrKBxI6HJXQ+UsNXysQIKFBm2s3h/UMwv8EWgB2lpVJ6sfflwbkQ39C+
         xfrGTRh8oIBPtiLnw0EX9yy2Lz/YsvknTaa4fTsjOe/hfUHoFURGgyKPkB15aMXBViYU
         UdLkuEfCPiaEKp3XQVx/kpZ+3ovp97Yxe/VKokruBcuQC/zvuW7KytmauYpdhYlwE3x/
         wry7WlJE3QM660rn/ak3U2Xi/NHuuz61rxORvaak484VOnnqG/fBpNGLGhsxNIBFiRnb
         hfOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=rv4XwDKSgvjg1QGd02a4HkvqpKcyB/qqVQgPLt/Texw=;
        b=gh5oehHI8bDeJcZFadoh4X3QifXpfojoGC8cjTVUvLxa7VW657+Q31fHKLIvUaSUJf
         n/wFIJ0WxXPEEWAyFtiWctxmm/4Xadqyf4P324Up0FMtuewZ44B3qNLP3HNg+/DSTeiY
         b8WQbxzpg2Fq/9Y/CKIIvuStYOziykV8PFE1GKzNTiBGmbfgw0FXnWy5HdVdJGsn40kg
         +9+Z6hrmXw87oT3DSAKjAmqjKcjYwyICqUoBq8FaG45zEnp82EWtKNcHY+TfAc2pB/WT
         1jiI2ns5RlyXMzpo28xp7rp6PXleR6Ox1Cs+xzdgG1pPrJA20lrqJw5GE6ftPYO51Vi4
         l0bw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id w7si879148qvf.49.2020.04.10.04.45.42;
        Fri, 10 Apr 2020 04:45:42 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgDJLpc (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 10 Apr 2020 07:45:32 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:52030 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726184AbgDJLpb (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Apr 2020 07:45:31 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 4943A601AB1A2B238AA8;
        Fri, 10 Apr 2020 19:45:27 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 10 Apr 2020
 19:45:21 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <peter.maydell@linaro.org>,
        <shannon.zhaosl@gmail.com>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>, <pbonzini@redhat.com>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>,
        <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v25 06/10] ACPI: Record the Generic Error Status Block address
Date:   Fri, 10 Apr 2020 19:46:35 +0800
Message-ID: <20200410114639.32844-7-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20200410114639.32844-1-gengdongjiu@huawei.com>
References: <20200410114639.32844-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: vCmhrgu6bMpc

Record the GHEB address via fw_cfg file, when recording
a error to CPER, it will use this address to find out
Generic Error Data Entries and write the error.

In order to avoid migration failure, make hardware
error table address to a part of GED device instead
of global variable, then this address will be migrated
to target QEMU.

Acked-by: Xiang Zheng <zhengxiang9@huawei.com>
Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
change since v24:
1. Use s->ghes_state.ghes_addr_le to check in ghes_needed()
2. Using hardware_error->len instead of request_block_size to calculate in acpi_ghes_add_fw_cfg()
3. Remove assert(vms->acpi_dev) be build APEI table
4. Directly use ACPI_GED(vms->acpi_dev) instead of ACPI_GED(vms->acpi_dev)
---
 hw/acpi/generic_event_device.c         | 19 +++++++++++++++++++
 hw/acpi/ghes.c                         | 14 ++++++++++++++
 hw/arm/virt-acpi-build.c               |  8 ++++++++
 include/hw/acpi/generic_event_device.h |  2 ++
 include/hw/acpi/ghes.h                 |  6 ++++++
 5 files changed, 49 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 021ed2b..1491291 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -234,6 +234,24 @@ static const VMStateDescription vmstate_ged_state = {
     }
 };
 
+static bool ghes_needed(void *opaque)
+{
+    AcpiGedState *s = opaque;
+    return s->ghes_state.ghes_addr_le;
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
@@ -244,6 +262,7 @@ static const VMStateDescription vmstate_acpi_ged = {
     },
     .subsections = (const VMStateDescription * []) {
         &vmstate_memhp_state,
+        &vmstate_ghes_state,
         NULL
     }
 };
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 091fd87..e74af23 100644
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
@@ -213,3 +215,15 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker)
     build_header(linker, table_data, (void *)(table_data->data + hest_start),
         "HEST", table_data->len - hest_start, 1, NULL, NULL);
 }
+
+void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
+                          GArray *hardware_error)
+{
+    /* Create a read-only fw_cfg file for GHES */
+    fw_cfg_add_file(s, ACPI_GHES_ERRORS_FW_CFG_FILE, hardware_error->data,
+                    hardware_error->len);
+
+    /* Create a read-write fw_cfg file for Address */
+    fw_cfg_add_file_callback(s, ACPI_GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL,
+        NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
+}
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f611bce..2726aac 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -911,6 +911,7 @@ void virt_acpi_setup(VirtMachineState *vms)
 {
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
+    AcpiGedState *acpi_ged_state;
 
     if (!vms->fw_cfg) {
         trace_virt_acpi_setup();
@@ -941,6 +942,13 @@ void virt_acpi_setup(VirtMachineState *vms)
     fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
                     acpi_data_len(tables.tcpalog));
 
+    if (vms->ras) {
+        assert(vms->acpi_dev);
+        acpi_ged_state = ACPI_GED(vms->acpi_dev);
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
