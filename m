Received: by 10.28.71.27 with SMTP id u27csp1915092wma;
        Thu, 22 Feb 2018 04:47:02 -0800 (PST)
X-Google-Smtp-Source: AH8x226KwIluFCJvVE2Qsv260Ev8DmhM915yABDIETA2uc+cFGKyxcC4ZxPOr86b/5UYkGKwHZAq
X-Received: by 10.200.40.70 with SMTP id 6mr11270722qtr.285.1519303622093;
        Thu, 22 Feb 2018 04:47:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519303622; cv=none;
        d=google.com; s=arc-20160816;
        b=zQKsBbyTDxVdlDfFaPb0Zja01/mxdCaWoMus67p8D7w8LwcdMSMGFnf4HCT4y1Bfuc
         awcW5QvlcC+ppT5cILcc2pp/BVmWBhWk4FPAJQL939Wau/VRYPYLfoLu33HlxwyHSmis
         9GKsJz5k/pFbpaR5C1WDK5uva3wXYMjuxFN+mHVCbTw212l+9UzZyQeOUCTfXPsq+GdP
         9rz9C29eUd1S5LwWdIRZVbVCrHm7JCCOcYricUDPB1hBfRKUVQEcdSR6GfLF+WyQs2ct
         tZau+qaT84ndSOaDcCFzF3DRmQOuGFZxULFPm5AYtMKCOs+XYW036agRZGKJlAT407Ak
         YC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=tXMDAp4IRze3epqur4Qkdu005ZsRjajnxRueOr5WQdE=;
        b=hmHk5eWpPlDIVbO0M3TNzMr/wJH6fGT0fVz3TnMmTdn9UaSFV9jIS11LXq/04Eiwh8
         4zYIZU2G8Q3gB/R90/ozhW3AKq9iXUL9i/pBxcZ67SHnopczctFkiTzYb/2G5JNHnAdE
         pBdxftSFc3LysR/Qi8AnFa9cY3IMEt9dUwnllPFNIIw0FrSiysOq+rHuoa+YFDecQiiG
         y055KdkeoEZHKl5I+BFDDycZjECxecB9W9g68PirQWJV/rxmG+zf83csZTxAYES9VbEx
         K6omx2XQFWkf8PPp878UI05VjFPdJn3Z8BYrrboSunqnDHtsAwB09aWPz7AF6XE5qK6W
         CF/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q68si7281qkq.220.2018.02.22.04.47.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 04:47:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoqH5-0007Xz-K5
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 07:46:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eoqEk-0005dM-25
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 07:44:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eoqEh-0005Jg-R3
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 07:44:34 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41756 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1eoqEh-0005IU-KI; Thu, 22 Feb 2018 07:44:31 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F9AA40363B6;
	Thu, 22 Feb 2018 12:44:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 38C042024CA9;
	Thu, 22 Feb 2018 12:44:30 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Feb 2018 13:42:55 +0100
Message-Id: <1519303376-92875-9-git-send-email-imammedo@redhat.com>
In-Reply-To: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
References: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 22 Feb 2018 12:44:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 22 Feb 2018 12:44:31 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 8/9] virt_arm: acpi: reuse common build_fadt()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jb1oewjYvZ08

Extend generic build_fadt() to support rev5.1 FADT
and reuse it for 'virt' board, it would allow to
phase out usage of AcpiFadtDescriptorRev5_1 and
later ACPI_FADT_COMMON_DEF.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 12 ++----------
 hw/acpi/aml-build.c         | 21 ++++++++++++++++++++-
 hw/arm/virt-acpi-build.c    | 33 ++++++++++++---------------------
 3 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index e0accc4..34e49dc 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -165,16 +165,6 @@ struct AcpiFadtDescriptorRev3 {
 } QEMU_PACKED;
 typedef struct AcpiFadtDescriptorRev3 AcpiFadtDescriptorRev3;
 
-struct AcpiFadtDescriptorRev5_1 {
-    ACPI_FADT_COMMON_DEF
-    /* 64-bit Sleep Control register (ACPI 5.0) */
-    struct AcpiGenericAddress sleep_control;
-    /* 64-bit Sleep Status register (ACPI 5.0) */
-    struct AcpiGenericAddress sleep_status;
-} QEMU_PACKED;
-
-typedef struct AcpiFadtDescriptorRev5_1 AcpiFadtDescriptorRev5_1;
-
 typedef struct AcpiFadtData {
     struct AcpiGenericAddress pm1_cnt;   /* PM1a_CNT_BLK */
     struct AcpiGenericAddress pm1_evt;   /* PM1a_EVT_BLK */
@@ -192,6 +182,8 @@ typedef struct AcpiFadtData {
     uint8_t  rtc_century;      /* CENTURY */
     uint16_t c2_latency;       /* P_LVL2_LAT */
     uint16_t c3_latency;       /* P_LVL3_LAT */
+    uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
+    uint8_t minor_ver;         /* FADT Minor Version */
 
     /*
      * respective tables offsets within ACPI_BUILD_TABLE_FILE,
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 17fb71b..5a33cd0 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1755,7 +1755,14 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
 
     build_append_gas_from_struct(tbl, &f->reset_reg); /* RESET_REG */
     build_append_int_noprefix(tbl, f->reset_val, 1); /* RESET_VALUE */
-    build_append_int_noprefix(tbl, 0, 3); /* Reserved, ACPI 3.0 */
+    /* Since ACPI 5.1 */
+    if ((f->rev >= 6) || ((f->rev == 5) && f->minor_ver > 0)) {
+        build_append_int_noprefix(tbl, f->arm_boot_arch, 2); /* ARM_BOOT_ARCH */
+        /* FADT Minor Version */
+        build_append_int_noprefix(tbl, f->minor_ver, 1);
+    } else {
+        build_append_int_noprefix(tbl, 0, 3); /* Reserved upto ACPI 5.0 */
+    }
     build_append_int_noprefix(tbl, 0, 8); /* X_FIRMWARE_CTRL */
 
     /* XDSDT address to be filled by Guest linker at runtime */
@@ -1779,6 +1786,18 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     build_append_gas_from_struct(tbl, &f->gpe0_blk); /* X_GPE0_BLK */
     build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0); /* X_GPE1_BLK */
 
+    if (f->rev <= 4) {
+        goto build_hdr;
+    }
+
+    /* SLEEP_CONTROL_REG */
+    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
+    /* SLEEP_STATUS_REG */
+    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
+
+    /* TODO: extra fields need to be added to support revisions above rev5 */
+    assert(f->rev == 5);
+
 build_hdr:
     build_header(linker, tbl, (void *)(tbl->data + fadt_start),
                  "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b644da9..c7c6a57 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -654,39 +654,30 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
                             VirtMachineState *vms, unsigned dsdt_tbl_offset)
 {
-    int fadt_start = table_data->len;
-    AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
-    unsigned xdsdt_entry_offset = (char *)&fadt->x_dsdt - table_data->data;
-    uint16_t bootflags;
+    /* ACPI v5.1 */
+    AcpiFadtData fadt = {
+        .rev = 5,
+        .minor_ver = 1,
+        .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
+        .xdsdt_tbl_offset = &dsdt_tbl_offset,
+    };
 
     switch (vms->psci_conduit) {
     case QEMU_PSCI_CONDUIT_DISABLED:
-        bootflags = 0;
+        fadt.arm_boot_arch = 0;
         break;
     case QEMU_PSCI_CONDUIT_HVC:
-        bootflags = ACPI_FADT_ARM_PSCI_COMPLIANT | ACPI_FADT_ARM_PSCI_USE_HVC;
+        fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT |
+                             ACPI_FADT_ARM_PSCI_USE_HVC;
         break;
     case QEMU_PSCI_CONDUIT_SMC:
-        bootflags = ACPI_FADT_ARM_PSCI_COMPLIANT;
+        fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT;
         break;
     default:
         g_assert_not_reached();
     }
 
-    /* Hardware Reduced = 1 and use PSCI 0.2+ */
-    fadt->flags = cpu_to_le32(1 << ACPI_FADT_F_HW_REDUCED_ACPI);
-    fadt->arm_boot_flags = cpu_to_le16(bootflags);
-
-    /* ACPI v5.1 (fadt->revision.fadt->minor_revision) */
-    fadt->minor_revision = 0x1;
-
-    /* DSDT address to be filled by Guest linker */
-    bios_linker_loader_add_pointer(linker,
-        ACPI_BUILD_TABLE_FILE, xdsdt_entry_offset, sizeof(fadt->x_dsdt),
-        ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
-
-    build_header(linker, table_data, (void *)(table_data->data + fadt_start),
-                 "FACP", table_data->len - fadt_start, 5, NULL, NULL);
+    build_fadt(table_data, linker, &fadt, NULL, NULL);
 }
 
 /* DSDT */
-- 
2.7.4

